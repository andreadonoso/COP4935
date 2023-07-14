using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class CDRDates : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
		if( !IsPostBack )
		{
			loadDates();
		}
    }

	protected void btnCancel_Click(object sender, EventArgs e)
	{
		Response.Redirect("Admin.aspx");
	}

	protected void btnSave_Click(object sender, EventArgs e)
	{
		lblError.Text = String.Empty;

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			string dates = txtCDRDates.Text.Trim().Replace("\r", "");
			string[] lines = dates.Split('\n');
			List<string> lineList = new List<string>();
			foreach( string s in lines )
			{
				lineList.Add(s.Trim());
			}

			string sql = "delete DatesAllowed";
			SqlCommand command = new SqlCommand(sql, connection);
			command.ExecuteNonQuery();

			foreach (string s in lineList)
			{
				try
				{
					DateTime dt = DateTime.Parse(s);
					sql = String.Format("insert into DatesAllowed (dt) VALUES ('{0}')",String.Format("{0}-{1}-{2}", dt.Month, dt.Day, dt.Year ));
					command = new SqlCommand(sql, connection);
					command.ExecuteNonQuery();
				}
				catch { }
			}

			lblError.Text = "The dates have been saved.";
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

	void loadDates()
	{
		lblError.Text = String.Empty;
		txtCDRDates.Text = String.Empty;

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			string sql = "select * from DatesAllowed order by dt";
			SqlCommand command = new SqlCommand(sql, connection);
			SqlDataReader reader = command.ExecuteReader();
			while( reader.Read() )
			{
				DateTime dt = Convert.ToDateTime(reader["dt"]);
				string thisDate = String.Format("{0}-{1}-{2}", dt.Month, dt.Day, dt.Year );
				txtCDRDates.Text += (thisDate + "\r\n");
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

}