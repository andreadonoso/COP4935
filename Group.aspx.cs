using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Group : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (Session["UserInfo"] == null)
		{
			Response.Redirect("Default.aspx");
		}
		
		Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"]; // MAYBE COPY THIS TOO
		
		if( !IsPostBack )
		{
			Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"];
			txtGroup.Text = Convert.ToString(ui.groupNumber);
		}

		// START COPY1
        if (ui.permissions == 0)
        {
            btnAdmin.Visible = false;
        }

        if (ui.groupNumber == -1)
        {
            Response.Redirect("Group.aspx");
        }

        if (ui.permissions == 0)
        {
            litBoxDiv.Text = "<div style=\"width: 90vw; min-width: 400px; height: 80vh; min-height: 596px; display: flex; background-color: rgba(0, 0, 0, 0.19); color: #ffffff; margin: 0; border-radius: 25px;\" id=\"mainBox\">";
        }
        else
        {
            litBoxDiv.Text = "<div style=\"width: 90vw; min-width: 400px; height: 80vh; min-height: 596px; display: flex; background-color: rgba(0, 0, 0, 0.19); color: #ffffff; margin: 0; border-radius: 25px;\" id=\"mainBox\">";
        }
        // END COPY1
	}

	protected void btnUpdate_Click(object sender, EventArgs e)
	{
		lblError.Text = String.Empty;

		string p1 = txtGroup.Text.Trim();
		int grp = -1;
		try
		{
			grp = Convert.ToInt32(p1);
		}
		catch(Exception ex)
		{
			lblError.Text = ex.Message.ToString();
			return;
		}

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"];
			ui.groupNumber = grp;
			Session["UserInfo"] = ui;

			string sql = String.Format("update users set Grp={0} where ID={1}", grp, ui.ID);
			SqlCommand command = new SqlCommand(sql, connection);
			command.ExecuteNonQuery();

			lblError.Text = "Group has been updated";
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

	// START COPY2
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
    // END COPY2
}