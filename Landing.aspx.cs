using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Landing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if( Session["UserInfo"] == null )
		{
			Response.Redirect("Default.aspx");
		}

		Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"];
		if (ui.permissions == 0)
		{
			btnAdmin.Visible = false;
		}
		
		if (ui.groupNumber == -1)
		{
			Response.Redirect("Group.aspx");
		}

//		litBoxDiv.Text = "<div style=\"background-color: #eeffee; width:500px; height: 484px; margin: auto; border-radius: 25px;\" id=\"mainBox\">";

//		Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"];
		lblFirst.Text = ui.first;
		lblMiddle.Text = ui.middle;
		lblLast.Text = ui.last;
		lblProgram.Text = ui.academicProgram;
		lblLevel.Text = ui.level;
		lblGroupNumber.Text = Convert.ToString(ui.groupNumber);
		lblDateLastOn.Text = ui.dateLastOn.ToShortDateString() + " " + ui.dateLastOn.ToShortTimeString();
		lblLoginCount.Text = Convert.ToString(ui.loginCount);

		if( ui.permissions == 0 )
		{
			litBoxDiv.Text = "<div style=\"background-color: #eeffee; width:500px; height: 550px; margin: auto; border-radius: 25px;\" id=\"mainBox\">";
		}
		else
		{
			litBoxDiv.Text = "<div style=\"background-color: #eeffee; width:500px; height: 596px; margin: auto; border-radius: 25px;\" id=\"mainBox\">";
		}
    }

	protected void btnLogOut_Click(object sender, EventArgs e)
	{
		Session["UserInfo"] = null;
		Response.Redirect("Default.aspx");
	}

	protected void btnGiveGroupPeerReview_Click(object sender, EventArgs e)
	{
		Response.Redirect("GiveTeamPeerReview.aspx");
	}
	
	protected void btnChangePassword_Click(object sender, EventArgs e)
	{
		Response.Redirect("Password.aspx");
	}

	protected void btnMeetings_Click(object sender, EventArgs e)
	{
		Response.Redirect("TeamMeetings.aspx");
	}

	protected void btnPeerReview_Click(object sender, EventArgs e)
	{
		int check = checkDateOK();
		Session["PeerReviewID"] = null;
		if (check == 2)
		{
			Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"];
			Session["NID"] = ui.NID;
			Response.Redirect("PeerReviewForm.aspx");
		}
		else if( check == 1 )
		{
			Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"];
			Session["NID"] = ui.NID;
			Response.Redirect("SelectPeerReviewDate.aspx");
		}
	}

	int checkDateOK()
	{
		int ret = 2;

//#if CRAP
		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			string sql = "select * from DatesAllowed";
			SqlCommand command = new SqlCommand(sql, connection);
			SqlDataReader reader = command.ExecuteReader();
			bool found = false;
			while( reader.Read() )
			{
				DateTime dt = Convert.ToDateTime(reader["dt"]);
				if( dt.Day == DateTime.Now.Day && dt.Month == DateTime.Now.Month && dt.Year == DateTime.Now.Year )
				{
					found = true;
				}
			}
			reader.Close();

			if( !found )
			{
				lblError.Text = "Today is not a day on which peer review for COP 4935 is collected.";
				return 1;
			}

			found = false;
			Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"];
			sql = String.Format("select * from PeerReview where NID='{0}' and dateTaken='{1}'", ui.NID, String.Format("{0}-{1}-{2}", DateTime.Now.Month, DateTime.Now.Day, DateTime.Now.Year ));
			command = new SqlCommand(sql, connection);
			reader = command.ExecuteReader();
			if( reader.Read() )
			{
				found = true;
			}
			reader.Close();

			if( found )
			{
				lblError.Text = "This NID has already submitted peer review today.";
				return 0;
			}
		}
		catch (Exception ex)
		{
			lblError.Text = ex.Message.ToString();
		}
		finally
		{
			if (connection.State == ConnectionState.Open)
			{
				connection.Close();
			}
		}
//#endif

		return ret;
	}

	protected void btnAdmin_Click(object sender, EventArgs e)
	{
		Response.Redirect("Admin.aspx");
	}

	protected void btnCHangeGroup_Click(object sender, EventArgs e)
	{
		Response.Redirect("Group.aspx");
	}

	protected void btnSeeMyGroupsPeerReview_Click(object sender, EventArgs e)
	{
		Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"];
		Session["GroupForReport"] = ui.groupNumber;
		Response.Redirect("PeerReview.aspx");
	}

}