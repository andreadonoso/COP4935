using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{

	protected void Page_Load(object sender, EventArgs e)
    {
		if( Session["UserInfo"] == null )
		{
			Response.Redirect("Default.aspx");
		}

		Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"];
		if( ui.permissions == 0 )
		{
			Response.Redirect("Landing.aspx");
		}
		
		if (ui.groupNumber == -1)
		{
			Response.Redirect("Group.aspx");
		}

    }

	protected void btnLogOut_Click(object sender, EventArgs e)
	{
		Session["UserInfo"] = null;
		Response.Redirect("Default.aspx");
	}

	protected void btnLandingPage_Click(object sender, EventArgs e)
	{
		Response.Redirect("Landing.aspx");
	}

	protected void btnUsers_Click(object sender, EventArgs e)
	{
		Response.Redirect("Users.aspx");
	}

	protected void btnReports_Click(object sender, EventArgs e)
	{
		Response.Redirect("Reports.aspx");
	}

	protected void btnCDRDates_Click(object sender, EventArgs e)
	{
		Response.Redirect("CDRDates.aspx");
	}
}