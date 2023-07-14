using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class TeamMeetings : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
		if (Session["UserInfo"] == null)
		{
			Response.Redirect("Default.aspx");
		}

		if( !IsPostBack )
		{
			Session["Voted"] = false;
			Session["DateRangeID"] = null;

			Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"];
			Session["PeerList"] = null;
			List<int> peerList = new List<int>();
			List<string> projectTypeList = new List<string>();
			Session["ProjectTypeList"] = null;

			SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
			try
			{
				connection.Open();

				string sql = "select * from MeetingDateRanges order by StartDate";
				SqlCommand command = new SqlCommand(sql, connection);
				SqlDataReader reader = command.ExecuteReader();
				litListOfRanges.Text = "<b>List of Meeting Date Ranges</b><br />\r\n";
				while (reader.Read())
				{
					string extra = String.Empty;
					DateTime start = Convert.ToDateTime(reader["StartDate"]);
					DateTime end = Convert.ToDateTime(reader["EndDate"]);
					string color = String.Empty;
					if( DateTime.Now >= start && DateTime.Now <= end )
					{
						extra = "<b><--</b>";
						color = "style=\"color: red;\"";
					}
					litListOfRanges.Text += String.Format("<span {3}>{0} - {1} {2}</span><br />\r\n", Convert.ToDateTime(reader["StartDate"]).ToShortDateString(), Convert.ToDateTime(reader["EndDate"]).ToShortDateString(), extra, color);

					projectTypeList.Add(Convert.ToString(reader["Project"]));
				}
				reader.Close();

				Session["ProjectTypeList"] = projectTypeList;

				string todaysDate = DateTime.Now.ToShortDateString();
				sql = String.Format("select * from MeetingDateRanges where StartDate<='{0}' and EndDate>='{0}'", todaysDate);
				command = new SqlCommand(sql, connection);
				reader = command.ExecuteReader();
				int rangeID = 0;
				if (reader.Read())
				{
					rangeID = Convert.ToInt32(reader["ID"]);
				}
				reader.Close();

				if (rangeID == 0)
				{
					lblMessage.Visible = true;
					lblMessage.Text = "You are not within one of the meeting review date ranges.";
					return;
				}

				Session["DateRangeID"] = rangeID;

				sql = String.Format("select * from Meetings where DateRangeID={0} and VoterID={1}", rangeID, ui.ID);
				command = new SqlCommand(sql, connection);
				reader = command.ExecuteReader();
				bool found = false;
				if (reader.Read())
				{
					found = true;
				}
				reader.Close();

				if (found)
				{
					lblMessage.Visible = true;
					lblMessage.Text = "You have already provided meeting feedback for this period.";
					return;
				}

				sql = String.Format("select * from Users where Grp={0} order by Last,First", ui.groupNumber);
				command = new SqlCommand(sql, connection);
				reader = command.ExecuteReader();

				int index = 0;
				while (reader.Read())
				{
					int id = Convert.ToInt32(reader["ID"]);
					peerList.Add(id);
					string first = Convert.ToString(reader["First"]);
					string middle = Convert.ToString(reader["Middle"]);
					string last = Convert.ToString(reader["Last"]);

					Label lbl = (Label)FindControl(String.Format("lblRadioLabel{0}", index));
					lbl.Visible = true;
					lbl.Text = first + " " + middle + " " + last + " &nbsp;&nbsp";
					if (ui.ID == id)
					{
						lbl.Text = first + " " + middle + " " + last + " (You) &nbsp;&nbsp;";
					}

					RadioButtonList rbtnList = (RadioButtonList)FindControl(String.Format("rbtnList{0}", index));
					rbtnList.Visible = true;

					ListItem li = new ListItem();
					li.Text = "&nbsp;Attended&nbsp;&nbsp;";
					rbtnList.Items.Add(li);
					li = new ListItem();
					li.Text = "&nbsp;Did Not Attend&nbsp;&nbsp;";
					rbtnList.Items.Add(li);

					index++;
				}

				reader.Close();

				btnSave.Enabled = true;
				btnSave.ForeColor = System.Drawing.Color.Black;

				Session["PeerList"] = peerList;
			}
			catch (Exception ex)
			{
				lblMessage.Visible = true;
				lblMessage.Text = ex.Message.ToString();
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

	protected void btnCancel_Click(object sender, EventArgs e)
	{
		Response.Redirect("Landing.aspx");
	}

	protected void btnSave_Click(object sender, EventArgs e)
	{
		lblMessage.Text = String.Empty;

		bool voted = (bool)Session["Voted"];
		if (voted)
		{
			lblMessage.Text = "You have already given your meeting feedback.";
			return;
		}

		Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"];
		List<int> peerList = (List<int>)Session["PeerLIst"];
		List<string> projectTypeList = (List<string>)Session["ProjectTypeList"];

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			for (int i = 0; i < 10; i++)
			{
				RadioButtonList rbtnList = (RadioButtonList)FindControl(String.Format("rbtnList{0}", i));
				if (rbtnList != null && rbtnList.Visible)
				{
					int selected = rbtnList.SelectedIndex;

					int score = selected + 1;
					if( selected == -1 )
					{
						score = 2;
					}

					string sql = String.Format("insert into Meetings (VoterID,PeerID,Score,DateRangeID,Grp,Project) VALUES ({0},{1},{2},{3},{4})", ui.ID, peerList[i], score, Session["DateRangeID"], ui.groupNumber, projectTypeList[i]);
					SqlCommand command = new SqlCommand(sql, connection);
					command.ExecuteNonQuery();
				}
			}

			btnSave.Enabled = false;
			btnSave.ForeColor = System.Drawing.Color.DarkGray;
			Session["Voted"] = true;

			lblMessage.Text = "Your meeting feedback has been recorded.";
		}
		catch (Exception ex)
		{
			lblMessage.Visible = true;
			lblMessage.Text = ex.Message.ToString();
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