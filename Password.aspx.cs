using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserInfo"] == null)
        {
            Response.Redirect("Default.aspx");
        }

        Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"]; // MAYBE COPY THIS TOO

        // START COPY1
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
        // END COPY1
    }

    protected void btnBackToLandingPage_Click(object sender, EventArgs e)
    {
        Response.Redirect("Landing.aspx");
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        lblError.Text = String.Empty;

        string p1 = txtPassword.Text.Trim();
        string p2 = txtConfirmPassword.Text.Trim();

        if (p1 != p2)
        {
            lblError.Text = "Passwords do not match.";
            return;
        }

        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        try
        {
            connection.Open();

            p1 = Utils.GetMd5Hash(p1);
            p2 = Utils.GetMd5Hash(p2);

            Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"];

            string sql = String.Format("update users set Password='{0}' where ID={1}", p1, ui.ID);
            SqlCommand command = new SqlCommand(sql, connection);
            command.ExecuteNonQuery();

            lblError.Text = "Password has been updated";
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