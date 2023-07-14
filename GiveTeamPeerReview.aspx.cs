using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class GiveTeamPeerReview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (Session["UserInfo"] == null)
		{
			Response.Redirect("Default.aspx");
		}

		if( !IsPostBack )
		{
			Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"];
			lblGroupNumber.Text = "Group Number: " + ui.groupNumber;
			
			SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
			try
			{
				connection.Open();
				
				DateTime start = DateTime.Now;
				while( start.DayOfWeek != DayOfWeek.Monday )
				{
					start = start.AddDays(-1);
				}
				while( start.Hour > 0 || start.Minute > 0 )
				{
					start = start.AddMinutes(-1);
				}
				
				DateTime end = DateTime.Now;
				while( end.DayOfWeek != DayOfWeek.Sunday )
				{
					end = end.AddDays(1);
				}
				while( end.Hour < 23 || end.Minute < 59 )
				{
					end = end.AddMinutes(1);
				}
				
				string sql = String.Format("select * from GroupPeerReview where DateScored>='{0} {1}' and DateScored<='{2} {3}' and VoterID={4} order by ID",
					start.ToShortDateString(),
					start.ToShortTimeString(),
					end.ToShortDateString(),
					end.ToShortTimeString(),
					ui.ID
					);
				
				List<int> scores = new List<int>();
				SqlCommand command = new SqlCommand(sql, connection);
				SqlDataReader reader = command.ExecuteReader();
				while( reader.Read() )
				{
					scores.Add( Convert.ToInt32( reader["Score"] ) );
				}
				reader.Close();

				if( scores.Count > 0 )
				{
					lblError.Text = "You have already given peer review this week.";
					for( int i=1; i<=scores.Count; i++ )
					{
						string txtName = "txtPeerReview" + i;
						TextBox txt = (TextBox)FindControl(txtName);
						txt.Text = "" + scores[i-1];
						txt.Enabled = false;
					}
					btnSave.Enabled = false;
				}
				
				int teamCount = 0;
				List<int> IDList = new List<int>();
				sql = String.Format("select * from Users where Grp={0} and ID<>{1} order by ID", ui.groupNumber, ui.ID );
				command = new SqlCommand(sql, connection);
				reader = command.ExecuteReader();
				while( reader.Read() )
				{
					teamCount++;
					string lblName = "lblUserName" + teamCount;
					Label lbl = (Label)FindControl(lblName);
					lbl.Text = Convert.ToString(reader["Last"]) + ", " + Convert.ToString(reader["First"]);
					lbl.Visible = true;
					
					string txtName = "txtPeerReview" + teamCount;
					TextBox txt = (TextBox)FindControl(txtName);
					txt.Visible = true;
					
					IDList.Add(Convert.ToInt32(reader["ID"]));
				}
				reader.Close();
				
				//12-29-2022
				Session["teamCount"] = teamCount;
				Session["IDList"] = IDList;
				Session["GroupID"] = ui.groupNumber;
				Session["VoterID"] = ui.ID;
			}
			catch(Exception ex)
			{
				lblError.Text = ex.Message;
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

	protected void btnBackToLandingPage_Click(object sender, EventArgs e)
	{
		Response.Redirect("Landing.aspx");
	}
	
	protected void btnSave_Click(object sender, EventArgs e)
	{
		if( Page.IsValid )
		{
			lblError.Text = String.Empty;
			
			int teamCount = Convert.ToInt32(Session["teamCount"]);
			List<int> IDList = (List<int>)Session["IDList"];
			
			SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
			try
			{
				connection.Open();
				
				for( int i=0; i<IDList.Count; i++ )
				{
					string txtName = "txtPeerReview" + (i+1);
					TextBox txt = (TextBox)FindControl(txtName);
					
					int score = 0;
					try
					{
						score = Convert.ToInt32(txt.Text.Trim());
					}
					catch{}
					string sql = String.Format("insert into GroupPeerReview (GroupID,Score,UserID,VoterID) VALUES ({0},{1},{2},{3})",
									Convert.ToInt32(Session["GroupID"]),
									score,
									IDList[i],
									Convert.ToInt32(Session["VoterID"])
									);
					SqlCommand command = new SqlCommand( sql, connection );
					command.ExecuteNonQuery();
				}
				lblError.Text += "Scores recorded";
			}
			catch(Exception ex)
			{
				lblError.Text += ex.Message;
			}
			finally
			{
				if( connection.State == ConnectionState.Open )
				{
					connection.Close();
				}
			}
			
			for( int i=0; i<teamCount; i++ )
			{
				string txtName = "txtPeerReview" + (i+1);
				TextBox txt = (TextBox)FindControl(txtName);
				txt.Enabled = false;
			}
			btnSave.Enabled = false;
		}
	}

}