using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Attendance : System.Web.UI.Page
{

	protected void Page_Load(object sender, EventArgs e)
    {

		lblError.Text = String.Empty;
		List<Utils.UserInfo> list;
		List<string> dates;
		if( !IsPostBack )
		{
			string error = String.Empty;
			list = Utils.loadUsers(ref error);
			if( error.Length > 0 )
			{
				lblError.Text = error;
			}
			Session["UserList"] = list;
			dates = Utils.getDates(ref error);
			if (error.Length > 0)
			{
				lblError.Text += error;
			}
			Session["DateList"] = dates;
			generateAttendanceContent(list,dates);
		}
		else
		{
			list = (List<Utils.UserInfo>)Session["UserList"];
			dates = (List<string>)Session["DateList"];
		}
    }

	void generateAttendanceContent(List<Utils.UserInfo> list,List<string> dates)
	{
		int cols = dates.Count;

		litAttendance.Text = String.Format("<table border=1><tr><td>&nbsp;</td><td align=center><b>Name</b></td><td align=center colspan={0}><b>Attendance</b></td><td><b>%</b></td></tr>\n", cols);
		litAttendance.Text += "\t\t\t\t<tr><td>&nbsp;</td><td>&nbsp;</td>";

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			for (int i = 0; i < cols; i++ )
			{
				try
				{
					string thisDate = dates[i];
					int mindex = thisDate.IndexOf("-");
					int dindex = thisDate.IndexOf("-", mindex + 1);
					string month = thisDate.Substring(0, mindex);
					string day = thisDate.Substring(mindex + 1, dindex - mindex - 1);
					string thisCol = String.Format("<td>{0}/<br />{1}</td>", month, day);
					litAttendance.Text += thisCol;
				}
				catch
				{
				}
			}
			litAttendance.Text += "<td>&nbsp;</td></tr>\r\n";

			for (int i = 0; i < list.Count; i++ )
			{
				string sql = String.Format("select * from PeerReview where NID='{0}'", list[i].NID);
				SqlCommand command = new SqlCommand(sql, connection);
				SqlDataReader reader = command.ExecuteReader();
				List<string> dateList = new List<string>();
				while (reader.Read())
				{
					DateTime dt = Convert.ToDateTime(reader["dateTaken"]);
					string thisDate = String.Format("{0}-{1}-{2}", dt.Month, dt.Day, dt.Year );
					dateList.Add(thisDate);
				}
				reader.Close();

				litAttendance.Text += String.Format("\t\t\t\t<tr><td>{2}</td><td>{0} {1}</td>", list[i].first, list[i].last, i + 1);
				int total = 0;
				for( int j=0; j<cols; j++ )
				{
					string checkMark = "&nbsp;";
					if( findDate( dates, dateList, j ) )
					{
						checkMark = "X";
						total++;
					}
					litAttendance.Text += String.Format("<td align=center>&nbsp;{0}&nbsp;</td>", checkMark);
				}
				litAttendance.Text += String.Format("<td align=center>({0} of {2}) {1}%</td></tr>\r\n", total, total * 100 / cols, cols );
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

		litAttendance.Text += "</tr>\r\n";
		litAttendance.Text += "</table>\r\n";

	}

	bool findDate( List<string> list, List<string> dates, int index )
	{
		string comparison = list[index];

		foreach( string s in dates )
		{
			if( s == comparison )
			{
				return true;
			}
		}
		
		return false;
	}

}