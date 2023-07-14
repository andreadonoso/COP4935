using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class PeerReviewThisPeriod : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (Session["UserInfo"] == null)
		{
			Response.Redirect("Default.aspx");
		}

		Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"];
		if (ui.permissions == 0)
		{
			Response.Redirect("Landing.aspx");
		}

		if (ui.groupNumber == -1)
		{
			Response.Redirect("Group.aspx");
		}

		if( !IsPostBack )
		{
			List<int> idList = new List<int>();

			SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
			try
			{
				connection.Open();

				string sql = "select * from PeerDateRanges order by StartDate";
				SqlCommand command = new SqlCommand(sql, connection);
				SqlDataReader reader = command.ExecuteReader();
				while( reader.Read() )
				{
					string name = Convert.ToDateTime(reader["StartDate"]).ToShortDateString() + " - " + Convert.ToDateTime(reader["EndDate"]);
					lstDateRanges.Items.Add(name);
					idList.Add(Convert.ToInt32(reader["ID"]));
				}
				reader.Close();

				Session["IDLIST"] = idList;
			}
			catch (Exception ex)
			{
				lblError.Visible = true;
				lblError.Text = ex.Message.ToString();
			}
			finally
			{
				if (connection.State == ConnectionState.Open)
				{
					connection.Close();
				}
			}
		}

	}

	protected void lstDateRanges_SelectedIndexChanged(object sender, EventArgs e)
	{
		lblError.Text = String.Empty;
		List<int> idList = (List<int>)Session["IDLIST"];
		int dateRangeID = idList[lstDateRanges.SelectedIndex];
		lstDateRanges.Visible = false;

		litResults.Text = Utils.startTable;

		List<Utils.UserInfo> uiList = new List<Utils.UserInfo>();
		List<Utils.RangeInfo> rangeList = new List<Utils.RangeInfo>();

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			rangeList = Utils.getDateRangeList(connection, "PeerDateRanges");
			int startID = 0, endID = 0, userIDRange = 0;
			uiList = Utils.getUserList(connection, ref startID, ref endID, ref userIDRange );

			int counter = 1;

			litResults.Text += Utils.createRangeStringTableRow(rangeList,dateRangeID,6);

			string sql = String.Format("select * from PeerReview where DateRangeID={0} order by PeerID", dateRangeID);
			SqlCommand command = new SqlCommand(sql, connection);
			SqlDataReader reader = command.ExecuteReader();

			int currentPeerID = -1;
			int score = 0, count = 0;
			int voterID = 0;

			while (reader.Read())
			{
				voterID = Convert.ToInt32(reader["VoterID"]);
				int peerID = Convert.ToInt32(reader["PeerID"]);
				if (currentPeerID == -1)
				{
					currentPeerID = peerID;
					score = Convert.ToInt32(reader["Score"]); ;
					count = 1;
				}
				else if (currentPeerID != peerID)
				{
					litResults.Text += Utils.createResultForPeerReviewRow(uiList, currentPeerID, counter, score, count, dateRangeID, voterID);
					counter++;

					currentPeerID = peerID;
					score = Convert.ToInt32(reader["Score"]); ;
					count = 1;
				}
				else
				{
					score += Convert.ToInt32(reader["Score"]); ;
					count++;
				}
			}

			reader.Close();

			if (count > 0)
			{
				litResults.Text += Utils.createResultForPeerReviewRow(uiList, currentPeerID, counter, score, count, dateRangeID, voterID);
			}

			litResults.Text += Utils.endTable;
			litResults.Visible = true;
		}
		catch (Exception ex)
		{
			lblError.Visible = true;
			lblError.Text = ex.Message.ToString();
		}
		finally
		{
			if (connection.State == ConnectionState.Open)
			{
				connection.Close();
			}
		}
	}

}