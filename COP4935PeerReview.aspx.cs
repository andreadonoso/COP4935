using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class COP4935PeerReview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		lblDate.Text = DateTime.Now.ToShortDateString();
    }

	protected void btnSubmit_Click(object sender, EventArgs e)
	{
		// Do submit stuff here.


		// Redirect to landing.
		Response.Redirect("Landing.aspx");
	}

	protected void btnCancel_Click(object sender, EventArgs e)
	{
		// Redirect to landing.
		Response.Redirect("Landing.aspx");
	}
}