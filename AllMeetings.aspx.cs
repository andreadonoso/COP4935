using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AllMeetings : System.Web.UI.Page
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
			showAllReports();
		}

    }

	void showAllReports()
	{
		lblError.Text = String.Empty;
		litResults.Text = Utils.startTable;

		List<Utils.UserInfo> uiList = new List<Utils.UserInfo>();
		List<Utils.RangeInfo> rangeList = new List<Utils.RangeInfo>();

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			rangeList = Utils.getDateRangeList(connection,"MeetingDateRanges");
			int startID = 0, endID = 0, userIDRange = 0;
			uiList = Utils.getUserList(connection, ref startID, ref endID, ref userIDRange);

			int index = 0;
			int voterID = 0;

			foreach (Utils.RangeInfo ri in rangeList)
			{

				int counter = 1;

				litResults.Text += Utils.createRangeStringTableRow(ri,10);

				string sql = String.Format("select * from Meetings where DateRangeID={0} order by Grp,PeerID", ri.ID);
				SqlCommand command = new SqlCommand(sql, connection);
				SqlDataReader reader = command.ExecuteReader();

				int currentPeerID = -1, currentGroup = -1; ;
				int score = 0, count = 0, iSaid = 0;

				while (reader.Read())
				{
					int group = Convert.ToInt32(reader["Grp"]);
					int scr = Convert.ToInt32(reader["Score"]);

					if (currentGroup == group)
					{
						litResults.Text += Utils.createGroupHeading(group);
						currentGroup = group;
					}

					voterID = Convert.ToInt32(reader["VoterID"]);
					int peerID = Convert.ToInt32(reader["PeerID"]);

					// First Pass through for this peer.
					if (currentPeerID == -1)
					{
						// Remember me.
						currentPeerID = peerID;

						score = 0;
						count = 0;
						iSaid = 0;

						// This is ME.
						if (voterID == peerID)
						{
							if (scr > 0)
							{
								iSaid = scr;
							}
						}

						// Others in my group.
						else
						{
							if (scr > 0)
							{
								score = scr == 1 ? 1 : 0;
								count = 1;
							}
						}

					}

					// Next peer. Create output for previous peer.
					else if (currentPeerID != peerID)
					{
						litResults.Text += Utils.createResultForMeetingRow(uiList, currentPeerID, counter, score, count, ri.ID, voterID, iSaid);
						counter++;

						currentPeerID = peerID;

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
