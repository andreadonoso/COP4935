using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ResetPassword : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
		if( !IsPostBack )
		{
			checkInfo();
		}
	}

	void checkInfo()
	{
		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			string userIDHash = Request.QueryString["one"].Trim();

			string salt = Request.QueryString["two"].Trim();

			string sql = String.Format("select * from PasswordRecovery where UserIDHash='{0}' and Salt='{1}' order by ID desc", userIDHash, salt);
			SqlCommand command = new SqlCommand(sql, connection);
			SqlDataReader reader = command.ExecuteReader();

			bool found = false;
			DateTime dt = DateTime.Now;
			int id = -1;
			int userID = -1;

			if (reader.Read())
			{
				found = true;

				dt = Convert.ToDateTime(reader["Expiration"]);
				id = Convert.ToInt32(reader["ID"]);
				userID = Convert.ToInt32(reader["UserID"]);
			}
			reader.Close();

			Session["userID"] = userID;

			if (found)
			{
				TimeSpan ts = DateTime.Now - dt;

				if (ts.TotalHours > 24)
				{
					lblError.Text = "That request has timed out.";
				}
				else
				{
					pnlTable.Visible = true;
				}

			}
			else
			{
				lblError.Text = "This record cannot be found.";
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
	}

	protected void btnReset_Click(object sender, EventArgs e)
	{
		string password = txtPassword.Text.Trim();
		string confirmPassword = txtConfirmPassword.Text.Trim();
		if( password != confirmPassword )
		{
			lblError.Text = "The passwords do not match";
		}
		else
		{
			setPassword(password);
		}
	}

	void setPassword( string password )
	{
		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			int userID = Convert.ToInt32( Session["userID"] );

			string sql = String.Format("update Users set password='{0}' where ID={1}", Utils.GetMd5Hash(password), userID );
			SqlCommand command = new SqlCommand(sql, connection);
			command.ExecuteNonQuery();

			lblError.Text = "Your password has been reset.";

			btnToLogin.Enabled = true;
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

	protected void btnToLogin_Click(object sender, EventArgs e)
	{
		Response.Redirect("default.aspx");
	}
}