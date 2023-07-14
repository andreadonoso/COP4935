using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PeerReviewForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (Session["UserInfo"] == null)
		{
			Response.Redirect("Default.aspx");
		}

		if( !IsPostBack )
		{
			if (Session["PeerReviewID"] == null)
			{
				litScript.Text = "\t<script>\r\n\t\tpopulateTodaysDate('');\r\n\t\tpopulateSemesterNumber();\r\n";
			}
			else
			{
				litScript.Text = "\t<script>\r\n\t\tpopulateTodaysDate('" + Convert.ToString(Session["PeerReviewID"]) + "');\r\n\t\tpopulateSemesterNumber();\r\n";
			}
			litScript.Text += String.Format("\t\tdocument.getElementById(\"NIDNumber\").innerHTML = '{0}'\r\n", Convert.ToString(Session["NID"]));
			litScript.Text += String.Format("\t\tNID = '{0}'\r\n", Convert.ToString(Session["NID"]));
			litScript.Text += "\t</script>\r\n";

			litSubmitButton.Text = "<button type=\"button\" id=\"btnSubmit\" style=\"width:150px; height:40px;\" onclick=\"sendResults('" + getDateID() + "');\">Submit</button>";

		}

    }

	public int getDateID()
	{
		if (Session["PeerReviewID"] == null)
		{
			return -1;
		}
		try
		{
			return (Convert.ToInt32(Session["PeerReviewID"]));
		}
		catch
		{
			return -1;
		}
	}

}