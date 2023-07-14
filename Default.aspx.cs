using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

	struct ID2Group
	{
		public int ID, Grp;
	}

	protected void btnLogin_Click(object sender, EventArgs e)
	{
		lblError.Text = String.Empty;

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

#if CRAP
			SqlCommand cmd = new SqlCommand("select * from Users", connection);
			SqlDataReader rdr = cmd.ExecuteReader();
			List<ID2Group> id2grp = new List<ID2Group>();
			while( rdr.Read() )
			{
				ID2Group i = new ID2Group();
				i.ID = Convert.ToInt32(rdr["ID"]);
				i.Grp = Convert.ToInt32(rdr["Grp"]);
				id2grp.Add(i);
			}
			rdr.Close();

			foreach( ID2Group i in id2grp )
			{
				cmd = new SqlCommand(String.Format("update Meetings set Grp={0} where VoterID={1}", i.Grp, i.ID ), connection );
				cmd.ExecuteNonQuery();
			}
#endif

			string email = txtEmail.Text.Trim().Replace("'","").Replace(";","");
			string password = txtPassword.Text.Trim().Replace("'","").Replace(";","");
			password = Utils.GetMd5Hash(password);

			string sql = String.Format("select * from Users where Email='{0}' and Password='{1}'", email, password );
			SqlCommand command = new SqlCommand(sql, connection);
			SqlDataReader reader = command.ExecuteReader();
			if( reader.Read() )
			{
				Utils.UserInfo ui = new Utils.UserInfo();
				ui.ID = Convert.ToInt32(reader["ID"]);
				ui.first = Convert.ToString(reader["First"]);
				ui.middle = Convert.ToString(reader["Middle"]);
				ui.last = Convert.ToString(reader["Last"]);
				ui.email = email;
				ui.password = password;
				ui.level = Convert.ToString(reader["Lev"]);
				ui.academicProgram = Convert.ToString(reader["AcademicPlan"]);
				ui.loginCount = Convert.ToInt32(reader["LoginCount"]) + 1;
				ui.dateLastOn = Convert.ToDateTime(reader["DateLastOn"]);
				ui.groupNumber = Convert.ToInt32(reader["Grp"]);
				ui.permissions = Convert.ToInt32(reader["Permissions"]);
				ui.NID = Convert.ToString(reader["NID"]);

				// 10-6-2020
				Session["GroupForReport"] = ui.groupNumber;

				Session["UserInfo"] = ui;
				reader.Close();

				sql = String.Format("update users set LoginCount=LoginCount+1 where ID={0}", ui.ID);
				command = new SqlCommand( sql, connection );
				command.ExecuteNonQuery();

				sql = String.Format("update users set DateLastOn='{0}' where ID={1}", DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString(), ui.ID);
				command = new SqlCommand(sql, connection);
				command.ExecuteNonQuery();

				Response.Redirect("Landing.aspx");
			}
			else
			{
				reader.Close();
				lblError.Text = "Email / Password combination not found.";
			}

		}
		catch(Exception ex)
		{
			lblError.Text = ex.Message.ToString();
		}
		finally
		{
			if( connection.State == ConnectionState.Open )
			{
				connection.Close();
			}
		}
	}
}