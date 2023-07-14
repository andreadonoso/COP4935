using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;

public partial class Forgot : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
	
	static string[] chars = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F" };
	static string APIKey = "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";

	protected void btnRecover_Click(object sender, EventArgs e)
	{
		Random rnd = new Random();
		int id = getID(txtEmail.Text);
		if( id > 0 )
		{
			string userIDHash = Utils.GetMd5Hash("" + id);
			string salt = String.Empty;

			for (int i = 0; i < 16; i++ )
			{
				salt += chars[rnd.Next() % 16];
			}

			if (storeUserInfoForRecovery(userIDHash, salt, id))
			{
				SmtpClient smtpClient = new SmtpClient("smtpout.secureserver.net", 80);
				smtpClient.UseDefaultCredentials = false;
				smtpClient.Credentials = new System.Net.NetworkCredential("Rick@Leinecker.com", "Rick1Life!");
				smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
				smtpClient.EnableSsl = false;

				MailMessage mail = new MailMessage();
				mail.IsBodyHtml = true;
				mail.From = new MailAddress("Richard.Leinecker@ucf.edu", "Forgotten Password");
				mail.To.Add(new MailAddress(txtEmail.Text.Trim()));
				mail.Subject = "Password Recovery";
				mail.Body = String.Format("<html><body><br /><br /><br />Click on this link to reset your password <a href=\"http://cop4935.com/ResetPassword.aspx?one={0}&two={1}\">CLICK HERE</a><br /><br />Please note that this expires after 24 hours.</body></html>", userIDHash, salt);

				try
				{
					smtpClient.Send(mail);
					lblError.Text = "Check your email for a reset link. (Also check your spamn folder)";
					btnBack.Enabled = true;
				}
				catch(Exception ex)
				{
					lblError.Text = ex.Message.ToString();
				}
			}
		}
	}

	bool storeUserInfoForRecovery(string userIDHash, string salt, int id)
	{
		bool ret = true;

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			string sql = String.Format("insert into PasswordRecovery (UserID,UserIDHash,Salt) VALUES ({0},'{1}','{2}')", id, userIDHash, salt );
			SqlCommand command = new SqlCommand(sql, connection);
			command.ExecuteNonQuery();
		}
		catch (Exception ex)
		{
			lblError.Text = ex.Message.ToString();
			ret = false;
		}
		finally
		{
			if (connection.State == ConnectionState.Open)
			{
				connection.Close();
			}
		}

		return ret;
	}

	int getID( string email )
	{
		lblError.Text = String.Empty;
		int id = -1;

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			string sql = String.Format("select ID from Users where Email='{0}'", email.Trim().Replace("'","").Replace(";","").Replace(" ",""));
			SqlCommand command = new SqlCommand(sql, connection);
			SqlDataReader reader = command.ExecuteReader();
			if( reader.Read() )
			{
				id = Convert.ToInt32(reader["ID"]);
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
		return id;
	}

	protected void btnBack_Click(object sender, EventArgs e)
	{
		Response.Redirect("default.aspx");
	}
	
}