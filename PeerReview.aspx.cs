using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;

public partial class PeerReview : System.Web.UI.Page
{
	List<string> dates;
	List<Utils.UserInfo> list;

    protected void Page_Load(object sender, EventArgs e)
    {

		if( Session["UserInfo"] == null )
		{
			Response.Redirect("Default.aspx");
		}
		
		lblError.Text = String.Empty;

		if( !IsPostBack )
		{
			// Change..
			// litPeerReview.Text = "<table border=1>\r\n<tr><th>Date</th><th>Group</th><th>Members</th><th>Scores</th></tr>\r\n";
			// to 2-21-2021
			litPeerReview.Text = "<table border=1>\r\n<tr><th>Date</th><th>Group</th><th>Members</th><th>Scores</th><th>Comments</th></tr>\r\n";

			string error = String.Empty;
			dates = Utils.getDates(ref error);
			if( error.Length > 0 )
			{
				lblError.Text = error;
			}

			list = Utils.loadUsers(ref error);
			if (error.Length > 0)
			{
				lblError.Text += (" " + error );
			}
            Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"];
            if (ui.permissions == 0)
            {
                btnAdmin.Visible = false;
                btnAdminMenu.Visible = false;
            }

           

            if (ui.permissions == 0)
            {
                litBoxDiv.Text = "<div style=\"width: 90vw; min-width: 400px; height: 80vh; min-height: 596px; display: flex; background-color: rgba(0, 0, 0, 0.19); color: #ffffff; margin: 0; border-radius: 25px;\" id=\"mainBox\">";
            }
            else
            {
                litBoxDiv.Text = "<div style=\"width: 90vw; min-width: 400px; height: 80vh; min-height: 596px; display: flex; background-color: rgba(0, 0, 0, 0.19); color: #ffffff; margin: 0; border-radius: 25px;\" id=\"mainBox\">";
            }

			SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
			try
			{
				connection.Open();

				foreach (string s in dates)
				{

					string sql = String.Format("select * from PeerReview where dateTaken='{0}'", s );
					SqlCommand command = new SqlCommand(sql, connection);
					SqlDataReader reader = command.ExecuteReader();
					while( reader.Read() )
					{
						int total1 = Convert.ToInt32(reader["total1"]);
						int total2 = Convert.ToInt32(reader["total2"]);
						int total3 = Convert.ToInt32(reader["total3"]);
						int total4 = Convert.ToInt32(reader["total4"]);
						string NID = Convert.ToString(reader["NID"]);
						string parts = Convert.ToString(reader["parts"]);
						string groups = Convert.ToString(reader["groups"]).Replace("NaN","0");

						// Added 2-21-2021
						string comments = cleanTags(Convert.ToString(reader["comments"]).Trim());

						//																Added parameter comments 2-21-2021.
						addGroups(total1, total2, total3, total4, NID, parts, groups, s, comments);

					}
					reader.Close();
				}

				IEnumerable<PeerReviewInfo> query = peerReviewList.OrderBy(peerReviewInfo => peerReviewInfo.group);

				// Now create the table row data
				foreach( PeerReviewInfo pri in query )
				{

					if (Session["GroupForReport"] != null)
					{
					
						int g = 0;
						try
						{
							g = Convert.ToInt32(Session["GroupForReport"]);
						}
						catch { }
						if (g != pri.group )
						{
							continue;
						}
					}

					string members = createMemberList(pri.group);

					// Added 2-21-2021
					string comments = createCommentsList(pri.comments);

					//																														{4} added 2-21-2021																									2-21-2021
					string scoreTable = String.Format("<tr><td valign=top>{1}</td><td valign=top>{2}</td><td valign=top>{3}</td><td valign=top>{0}</td><td valign=top>{4}</td></tr>\r\n", createScoreTable(pri.parts, pri.voters[0]), pri.dateTaken, pri.group, members, comments);

					string cmp = members.Replace("<table>","").Replace("</table>","");

					// 10-6-2020
					if (cmp != null && cmp.Length > 4)
					{
						litPeerReview.Text += scoreTable;
					}
				}

			}
			catch (Exception ex)
			{
				lblError.Text = ex.Message.ToString();

				// Get stack trace for the exception with source file information
				var st = new StackTrace(ex, true);
				// Get the top stack frame
				var frame = st.GetFrame(0);
				// Get the line number from the stack frame
				var line = frame.GetFileLineNumber();

				lblError.Text += ("<br />Line: " + line );
			}
			finally
			{
				if (connection.State == ConnectionState.Open)
				{
					connection.Close();
				}
			}

			litPeerReview.Text += "</table>\r\n";
		}
    }

	// Method added 2-21-2021
	string cleanTags( string data )
	{
		string ret = data.Trim();

		int index = ret.IndexOf("<");
		while( index >= 0 )
		{
			int index2 = ret.IndexOf("<", index);
			if( index2 < 0 )
			{
				index = 0;
			}
			else
			{
				ret = ret.Substring(0, index) + ret.Substring(index2 + 1);
				index = ret.IndexOf("<");
			}
		}

		return ret.Trim();
	}

	// Method created 2-21-2021
	public string createCommentsList(List<string> comments)
	{
		string ret = " ";

		foreach( string s in comments )
		{
			if( s.Length == 0  )
			{
				continue;
			}

			if( ret.Length > 1 )
			{
				ret += "<br />\r\n";
			}
			ret += ("* " + s);
		}

		return ret;
	}

	public struct PeerReviewInfo
	{
		public int group;
		public List<string> members;
		public List<int> scores;
		public List<int> voters;
		public List<string> parts;

		// Added 2-21-2021
		public List<string> comments;

		public string dateTaken;
	}

	List<PeerReviewInfo> peerReviewList = new List<PeerReviewInfo>();

	//																															added comments paramter 2-21-2-21
	void addGroups(int total1, int total2, int total3, int total4, string NID, string parts, string groups, string dateTaken, string comments )
	{
		int[] grpList = parseGroupList(groups);

		string[] _parts = parts.Split(':');

		// Fix later
		string[] __parts = new string[2];
		__parts[0] = _parts[0];
		__parts[1] = _parts[1];
		_parts = __parts;

		int count = 0;

		for (int i = 0; i < grpList.Length; i++)
		{

			if( grpList[i] == 0 )
			{
				continue;
			}

			int index = -1;

			foreach( PeerReviewInfo pri in peerReviewList )
			{
				if( pri.group == grpList[i] )
				{
					index = i;

					pri.parts.Add(_parts[count]);
					int voters = pri.voters[0] + 1;
					pri.voters.Clear();
					pri.voters.Add(voters);

					// Added 2-21-2021
					pri.comments.Add(comments);

					break;
				}
			}

			if( index == -1 )
			{
				PeerReviewInfo pri = new PeerReviewInfo();
				pri.group = grpList[i];
				pri.dateTaken = dateTaken;
				pri.parts = new List<string>();
				pri.parts.Add(_parts[count]);
				pri.voters = new List<int>();
				pri.voters.Add(1);

				// Added 2-21-2021
				pri.comments = new List<string>();
				pri.comments.Add(comments);

				peerReviewList.Add(pri);
			}

			count++;
		}
	}

	string getNameFromNID(string NID)
	{
		string ret = String.Empty;

		foreach( Utils.UserInfo ui in list )
		{
			if( ui.NID == NID )
			{
				ret = ui.first + " " + ui.last;
				break;
			}
		}

		return ret;
	}

	void addMember( List<string> memberList, string NID )
	{
		string name = getNameFromNID(NID);
		bool found = false;
		foreach( string s in memberList )
		{
			if( s == name )
			{
				found = true;
				break;
			}
		}
		if( !found )
		{
			memberList.Add(name);
		}
	}

	string createMemberList( int group )
	{
		string ret = "<table>\r\n";
		foreach( Utils.UserInfo ui in list )
		{
			if( group == ui.groupNumber )
			{
				ret += String.Format("<tr><td>{0} {1}</td></tr>\r\n", ui.first, ui.last);
			}
		}
		ret += "</table>\r\n";

		return ret;
	}

	string createScoreTable( List<string> scoreList, int memberCount )
	{
		string ret = "<table>\r\n";

		int[] partValues = new int[10];

		int count = 0;
		foreach( string s in scoreList )
		{
			string[] v = s.Split(',');
			int[] _v = new int[v.Length];
			for( int i=0; i<v.Length; i++ )
			{
				try
				{
					_v[i] = Convert.ToInt32(v[i]);
					partValues[i] += _v[i];
				}
				catch { }
			}
			count++;
		}

		int total = 0;
		for (int i = 0; i < partValues.Length; i++ )
		{
			partValues[i] /= count;
			total += partValues[i];
			ret += String.Format("<tr><td align=right>{1}</td><td align=center>{0}</td></tr>\r\n", partValues[i], Utils.categories[i] );
		}

		ret += String.Format("<tr><td align=right>Total&nbsp;</td><td align=center>{0}</td></tr>\r\n", total);

		ret += "</table\r\n";

		return ret;
	}

	int[] parseGroupList(string groups)
	{
		string[] groupList = groups.Split(';');
		int[] grpList = new int[2];//groupList.Length];
		for( int i=0; i<2/*groupList.Length*/; i++ ) // Fix later
		{
			try
			{
				grpList[i] = Convert.ToInt32( groupList[i] );
			}
			catch { }
		}
		return grpList;
	}

	protected void btnBackToAdmin_Click(object sender, EventArgs e)
	{
		Response.Redirect("Admin.aspx");
	}

    protected void btnBackToCDR_Click(object sender, EventArgs e)
    {
        Response.Redirect("CDR.aspx");
    }
    protected void btnUserInfo_Click(object sender, EventArgs e)
    {
        Response.Redirect("Landing.aspx");
    }

    protected void btnCDR_Click(object sender, EventArgs e)
    {
        Response.Redirect("CDR.aspx");
    }

    protected void btnAdmin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Admin.aspx");
    }

    protected void btnLogOut_Click(object sender, EventArgs e)
    {
        Session["UserInfo"] = null;
        Response.Redirect("Default.aspx");
    }
}