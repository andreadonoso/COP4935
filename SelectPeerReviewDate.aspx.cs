using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SelectPeerReviewDate : System.Web.UI.Page
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

			string sql = "select * from DatesAllowed order by ID";
			SqlCommand command = new SqlCommand(sql, connection);
			SqlDataReader reader = command.ExecuteReader();
			while( reader.Read() )
			{
				int ID = Convert.ToInt32(reader["ID"]);
				DateTime dt = Convert.ToDateTime( reader["dt"] );
				string date = dt.ToShortDateString();
				lstPeerDates.Items.Add(new ListItem(date,Convert.ToString(ID)));
			}
			reader.Close();
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

	}

	protected void btnBackToLandingPage_Click(object sender, EventArgs e)
	{
		Response.Redirect("Landing.aspx");
	}

    protected void btnBackToCDR_Click(object sender, EventArgs e)
    {
        Response.Redirect("CDR.aspx");
    }

	protected void lstPeerDates_SelectedIndexChanged(object sender, EventArgs e)
	{
		int index = lstPeerDates.SelectedIndex;
		if( index >= 0 )
		{
			Session["PeerReviewID"] = lstPeerDates.Items[index].Text;
			Response.Redirect("PeerReviewForm.aspx");
		}
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