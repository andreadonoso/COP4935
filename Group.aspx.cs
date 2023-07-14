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

		if( !IsPostBack )
		{
			Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"];
			txtGroup.Text = Convert.ToString(ui.groupNumber);
		}
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

}