using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reports : System.Web.UI.Page
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
		
	}

	protected void btnAllPeerReview_Click(object sender, EventArgs e)
	{
		Response.Redirect("AllPeerReview.aspx");
	}

	protected void btnThisPeriodPeerReview_Click(object sender, EventArgs e)
	{
		Response.Redirect("PeerReviewSelectedPeriod.aspx");
	}

	protected void btnSingleStudentPeerReview_Click(object sender, EventArgs e)
	{
		Response.Redirect("PeerReviewSelectedUser.aspx");
	}

	protected void btnAllMeetingReporting_Click(object sender, EventArgs e)
	{
		Response.Redirect("AllMeetings.aspx");
	}

	protected void Button1_Click(object sender, EventArgs e)
	{
		Response.Redirect("MeetingsSelectedPeriod.aspx");
	}

	protected void Button2_Click(object sender, EventArgs e)
	{
		Response.Redirect("MeetingsSelectedUser.aspx");
	}

	protected void btnPeerReview_Click(object sender, EventArgs e)
	{
		Session["GroupForReport"] = null;
		Response.Redirect("PeerReview.aspx");
	}

	protected void btnAttendance_Click(object sender, EventArgs e)
	{
		Response.Redirect("Attendance.aspx");
	}

	protected void btnBackToLandingPage_Click(object sender, EventArgs e)
	{
		Response.Redirect("Landing.aspx");
	}
}