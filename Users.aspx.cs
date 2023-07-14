using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Users : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
		if (Session["UserInfo"] == null)
		{
			Response.Redirect("Landing.aspx");
		}

		Utils.UserInfo ui = (Utils.UserInfo)Session["UserInfo"];
		if (ui.permissions == 0)
		{
			Response.Redirect("Landing.aspx");
		}
		
		if (ui.groupNumber == -1)
		{
			Response.Redirect("Group.aspx");
		}
		
	}

	protected void btnCancel_Click(object sender, EventArgs e)
	{
		Response.Redirect("Admin.aspx");
	}

	protected void btnSearch_Click(object sender, EventArgs e)
	{
		lblError2.Text = String.Empty;
		lstSearchResults.Items.Clear();
		List<int> idList = new List<int>();
		Session["IDLIst"] = null;

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			string searchCriteria = Utils.cleanString( txtSearchCriteria.Text );

			string sql = String.Format("select First,Middle,Last,ID from Users where First like '%{0}%' OR Middle like '%{0}%' OR Last like '%{0}%' OR Email like '%{0}%' order by Last,First,Middle", searchCriteria);
			SqlCommand command = new SqlCommand(sql, connection);
			SqlDataReader reader = command.ExecuteReader();
			while( reader.Read() )
			{
				string name = Convert.ToString(reader["First"]) + " " + Convert.ToString(reader["Middle"]) + " " + Convert.ToString(reader["Last"]);
				lstSearchResults.Items.Add(name);
				idList.Add(Convert.ToInt32(reader["ID"]));
			}
			reader.Close();

			Session["IDList"] = idList;
		}
		catch (Exception ex)
		{
			lblError2.Text = ex.Message.ToString();
		}
		finally
		{
			if (connection.State == ConnectionState.Open)
			{
				connection.Close();
			}
		}
	}

	protected void lstSearchResults_SelectedIndexChanged(object sender, EventArgs e)
	{
		if( Session["IDList"] == null )
		{
			lblError2.Text = "ID List Session Variable is null";
			return;
		}

		lblError2.Text = String.Empty;
		List<int> idList = (List<int>)Session["IDList"];

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			string sql = String.Format("select * from Users where ID={0}", idList[lstSearchResults.SelectedIndex] );
			SqlCommand command = new SqlCommand(sql, connection);
			SqlDataReader reader = command.ExecuteReader();
			if( reader.Read() )
			{
				txtFirst.Text = Convert.ToString(reader["First"]);
				txtMiddle.Text = Convert.ToString(reader["Middle"]);
				txtLast.Text = Convert.ToString(reader["Last"]);
				txtEmail.Text = Convert.ToString(reader["Email"]);
				txtPermissions.Text = Convert.ToString(reader["Permissions"]);
				txtLevel.Text = Convert.ToString(reader["Lev"]);
				txtAcademicPlan.Text = Convert.ToString(reader["AcademicPlan"]);
				txtGroup.Text = Convert.ToString(reader["Grp"]);

				Session["SelectedUserName"] = txtFirst.Text + " " + txtMiddle.Text + " " + txtLast.Text;
				Session["SelectedUserID"] = idList[lstSearchResults.SelectedIndex];
			}
			reader.Close();
		}
		catch (Exception ex)
		{
			lblError2.Text = ex.Message.ToString();
		}
		finally
		{
			if (connection.State == ConnectionState.Open)
			{
				connection.Close();
			}
		}
	}

	void doNew()
	{
		txtFirst.Text = String.Empty;
		txtMiddle.Text = String.Empty;
		txtLast.Text = String.Empty;
		txtEmail.Text = String.Empty;
		txtPermissions.Text = String.Empty;
		txtLevel.Text = String.Empty;
		txtAcademicPlan.Text = String.Empty;
		txtGroup.Text = String.Empty;

		Session["SelectedUserID"] = -1;
	}

	protected void btnNew_Click(object sender, EventArgs e)
	{
		lblError.Text = String.Empty;
		doNew();
	}

	protected void btnSave_Click(object sender, EventArgs e)
	{
		lblError.Text = String.Empty;

		if( Session["SelectedUserID"] == null )
		{
			Session["SelectedUserID"] = -1;
//			lblError.Text = "SelectedUserID is null";
//			return;
		}

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			int id = Convert.ToInt32(Session["SelectedUserID"]);
			string sql = String.Empty;

			if (id >= 0)
			{
				sql = String.Format("update Users set First='{0}',Middle='{1}',Last='{2}',Email='{3}',Permissions={4},Lev='{5}',AcademicPlan='{6}',Grp={7} where ID={8}",
					Utils.cleanString(txtFirst.Text),
					Utils.cleanString(txtMiddle.Text),
					Utils.cleanString(txtLast.Text),
					Utils.cleanString(txtEmail.Text),
					Convert.ToInt32(Utils.cleanString(txtPermissions.Text)),
					Utils.cleanString(txtLevel.Text),
					Utils.cleanString(txtAcademicPlan.Text),
					Convert.ToInt32(Utils.cleanString(txtGroup.Text)),
					id
					);

				SqlCommand command = new SqlCommand(sql, connection);
				command.ExecuteNonQuery();

				lblError.Text = "User information updated.";
			}
			else
			{
				string p1 = Utils.cleanString(txtPassword.Text);
				string p2 = Utils.cleanString(txtConfirm.Text);
				if (p1 != p2)
				{
					lblError.Text = "The passwords do not match.";
					return;
				}

				string password = Utils.cleanString(txtPassword.Text.Trim());
				if( password.Length < 6 )
				{
					lblError.Text = "You must have a password of at least six characters.";
					return;
				}

				sql = String.Format("insert into Users (First,Middle,Last,Email,Permissions,Lev,AcademicPlan,Grp,Password) VALUES ('{0}','{1}','{2}','{3}',{4},'{5}','{6}',{7},'{8}') select @ID = @@IDENTITY",
					Utils.cleanString(txtFirst.Text),
					Utils.cleanString(txtMiddle.Text),
					Utils.cleanString(txtLast.Text),
					Utils.cleanString(txtEmail.Text),
					Convert.ToInt32(Utils.cleanString(txtPermissions.Text)),
					Utils.cleanString(txtLevel.Text),
					Utils.cleanString(txtAcademicPlan.Text),
					Convert.ToInt32(Utils.cleanString(txtGroup.Text)),
					Utils.GetMd5Hash(password)
					);
				SqlCommand objCommand = new SqlCommand(sql, connection);
				objCommand.Parameters.Add("@ID", SqlDbType.Int);
				objCommand.Parameters["@ID"].Direction = ParameterDirection.Output;
				objCommand.ExecuteNonQuery();
				Session["SelectedUserID"] = Convert.ToUInt32(objCommand.Parameters["@ID"].Value);

				lblError.Text = "New user added.";
			}
		}
		catch (Exception ex)
		{
			lblError2.Text = ex.Message.ToString();
		}
		finally
		{
			if (connection.State == ConnectionState.Open)
			{
				connection.Close();
			}
		}
	}

	protected void btnChangePassword_Click(object sender, EventArgs e)
	{
		lblError.Text = String.Empty;

		if( Session["SelectedUserID"] == null )
		{
			lblError.Text = "SelectedUserID is null";
			return;
		}

		int id = Convert.ToInt32(Session["SelectedUserID"]);
		if( id < 0 )
		{
			lblError.Text = "The password will be saved when you save the entire record.";
			return;
		}

		string password = Utils.cleanString(txtPassword.Text.Trim());
		if (password.Length < 6)
		{
			lblError.Text = "You must have a password of at least six characters.";
			return;
		}

		string p1 = Utils.cleanString(txtPassword.Text);
		string p2 = Utils.cleanString(txtConfirm.Text);
		if (p1 != p2)
		{
			lblError.Text = "The passwords do not match.";
			return;
		}

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			string sql = String.Format("update Users set Password='{0}' where ID={1}", Utils.GetMd5Hash(password), id );
			SqlCommand command = new SqlCommand(sql, connection);
			command.ExecuteNonQuery();

			lblError.Text = "The password has been updated.";
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

	protected void btnDelete_Click(object sender, EventArgs e)
	{
		if (Session["SelectedUserID"] == null)
		{
			lblError.Text = "SelectedUserID is null";
			return;
		}

		int id = Convert.ToInt32(Session["SelectedUserID"]);
		if (id < 0)
		{
			lblError.Text = "This user record has not been saved to the database.";
			return;
		}

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			string sql = String.Format("delete Users where ID={0}", id);
			SqlCommand command = new SqlCommand(sql, connection);
			command.ExecuteNonQuery();

			doNew();
			lblError.Text = "The user has been deleted.";
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