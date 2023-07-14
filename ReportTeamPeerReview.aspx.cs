using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ReportTeamPeerReview : System.Web.UI.Page
{
	
	static public int numGroups = 30;
	
	public struct ScoreInfo
	{
		public int userID, voterID, groupNumber, score;
	}
	
	public struct UserInfo
	{
		public int userID;
		public int groupNumber;
		public string first, last;
	}
	
	string getName( int userID, List<UserInfo> uiList )
	{
		for( int i=0; i<uiList.Count; i++ )
		{
			if( userID == uiList[i].userID )
			{
				return uiList[i].first + " " + uiList[i].last;
			}
		}
		return String.Empty;
	}
	
    protected void Page_Load(object sender, EventArgs e)
    {
		if (Session["UserInfo"] == null)
		{
			Response.Redirect("Default.aspx");
		}

		Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"];
		if( ui.permissions == 0 )
		{
			Response.Redirect("Landing.aspx");
		}
		
		if( !IsPostBack )
		{
			SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
			try
			{
				connection.Open();
				
				List<UserInfo> uiList = new List<UserInfo>();
				string sql = "select * from Users";
				SqlCommand command = new SqlCommand( sql, connection );
				SqlDataReader reader = command.ExecuteReader();
				while( reader.Read() )
				{
					//public int userID;
					//public int groupNumber;
					//public string first, last;
					
					UserInfo ui2 = new UserInfo();
					ui2.userID = Convert.ToInt32(reader["ID"]);
					ui2.groupNumber = Convert.ToInt32( reader["Grp"] );
					ui2.first = Convert.ToString( reader["First"] );
					ui2.last = Convert.ToString( reader["Last"] );
					uiList.Add( ui2 );
				}
				reader.Close();
				
				DateTime current = new DateTime(2023, 1, 9, 0, 0,0,0);
				for( int i=0; i<10; i++ )
				{
					current = current.AddDays( 3 );
					Response.Write("<b>"+current.ToShortDateString()+"</b><br />\r\n");
					
					for( int grp=1; grp<=numGroups; grp++ )
					{
						List<ScoreInfo> list = new List<ScoreInfo>();
						
						sql = String.Format("select * from GroupPeerReview where DateScored='{0}' and GroupID={1} order by UserID",
							current.ToShortDateString() + " " + current.ToShortTimeString(),
							grp
							);
							
						command = new SqlCommand( sql, connection );
						reader = command.ExecuteReader();
						while( reader.Read() )
						{
							//userID, voterID, groupNumber, score;
							ScoreInfo si = new ScoreInfo();
							si.userID = Convert.ToInt32( reader["UserID"] );
							si.groupNumber = Convert.ToInt32( reader["GroupID"] );
							si.voterID = Convert.ToInt32( reader["VoterID"] );
							si.score = Convert.ToInt32( reader["Score"] );
							list.Add( si );
						}
						reader.Close();

						int userID = -1;
						int total = 0, count = 0;
						for( int scores=0; scores<list.Count; scores++ )
						{
							if( list[scores].userID != userID )
							{
								if( userID != -1 )
								{
									Response.Write(String.Format("{0}\t{1}<br />\r\n", getName(userID,uiList), (float)total / (float)count ));
								}
								userID = list[scores].userID;
								total = count = 0;
							}
							total += list[scores].score;
							count++;
						}
						
						if( count != 0 )
						{
							Response.Write(String.Format("{0}\t{1}<br />\r\n", getName(userID,uiList), (float)total / (float)count ));
						}

					}
					
					current = current.AddDays( 4 );
				}

			}
			catch(Exception ex)
			{
				Response.Write(ex.Message);
			}
			finally
			{
				if( connection.State == ConnectionState.Open )
				{
					connection.Close();
				}
			}

		}
	}

}
