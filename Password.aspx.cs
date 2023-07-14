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
		if( Session["UserInfo"] == null )
		{
			Response.Redirect("Default.aspx");
		}
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

		if( p1 != p2 )
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

			string sql = String.Format("update users set Password='{0}' where ID={1}", p1, ui.ID );
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
}