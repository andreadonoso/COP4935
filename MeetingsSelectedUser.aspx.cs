using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class MeetingsSelectedUser : System.Web.UI.Page
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

		if (!IsPostBack)
		{
			List<int> idList = new List<int>();

			SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
			try
			{
				connection.Open();

				string sql = "select * from Users order by Last,First";
				SqlCommand command = new SqlCommand(sql, connection);
				SqlDataReader reader = command.ExecuteReader();
				while (reader.Read())
				{
					string name = Convert.ToString(reader["First"]) + " " + Convert.ToString(reader["Middle"]) + " " + Convert.ToString(reader["Last"]);
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
		int userID = idList[lstDateRanges.SelectedIndex];
		lstDateRanges.Visible = false;

		litResults.Text = Utils.startTable;

		List<Utils.UserInfo> uiList = new List<Utils.UserInfo>();
		List<Utils.RangeInfo> rangeList = new List<Utils.RangeInfo>();

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			rangeList = Utils.getDateRangeList(connection, "MeetingDateRanges");
			int startID = 0, endID = 0, userIDRange = 0;
			uiList = Utils.getUserList(connection, ref startID, ref endID, ref userIDRange);

			int index = 0;
			int voterID = 0;

			foreach (Utils.RangeInfo ri in rangeList)
			{
				int counter = 1;

				litResults.Text += Utils.createRangeStringTableRow(ri, 10);

				string sql = String.Format("select * from Meetings where PeerID={0} and DateRangeID={1} order by Grp", userID, ri.ID);
				SqlCommand command = new SqlCommand(sql, connection);
				SqlDataReader reader = command.ExecuteReader();

				int currentPeerID = -1, currentGroup = -1; ;
				int score = 0, count = 0, iSaid = 0;

				while (reader.Read())
				{
					int group = Convert.ToInt32(reader["Grp"]);

					voterID = Convert.ToInt32(reader["VoterID"]);
					int peerID = Convert.ToInt32(reader["PeerID"]);

					if (currentPeerID == -1)
					{
						currentPeerID = peerID;

						int scr = Convert.ToInt32(reader["Score"]);

						score = 0;
						count = 0;
						iSaid = 0;

						if (voterID == peerID)
						{
							if (scr > 0)
							{
								iSaid = scr;
							}
						}
						else
						{
							if (scr > 0)
							{
								score = scr == 1 ? 1 : 0;
								count = 1;
							}
						}

					}
					else if (currentPeerID != peerID)
					{
						litResults.Text += Utils.createResultForMeetingRow(uiList, currentPeerID, counter, score, count, ri.ID, voterID, iSaid);
						counter++;

						currentPeerID = peerID;

						int scr = Convert.ToInt32(reader["Score"]);

						score = 0;
						count = 0;
						iSaid = 0;

						if (voterID == peerID)
						{
							iSaid = scr;
						}
						else
						{
							score = scr == 1 ? 1 : 0;
							count = 1;
						}
					}
					else
					{
						currentPeerID = peerID;

						int scr = Convert.ToInt32(reader["Score"]);

						if (voterID == peerID)
						{
							if (scr > 0)
							{
								iSaid = scr;
							}
						}
						else
						{
							if (scr > 0)
							{
								score += (scr == 1 ? 1 : 0);
								count++;
							}
						}
					}

				}
				reader.Close();

				if (count > 0)
				{
					litResults.Text += Utils.createResultForMeetingRow(uiList, currentPeerID, counter, score, count, ri.ID, voterID, iSaid);
				}

				litResults.Text += Utils.endAndRestartTable;
				index++;
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