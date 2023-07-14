using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Utils
/// </summary>
public class Utils
{

	public static string[] categories = 
	{
		"Tecnical difficulty... &nbsp;",
		"Problem understanding... &nbsp;",
		"Quality of problem solv... &nbsp;",
		"Design and implement... &nbsp;",
		"Apparent distribution... &nbsp;",
		"Project definition and... &nbsp;",
		"Presentation of problem... &nbsp;",
		"Presentation of technical... &nbsp;",
		"Presentation of admin... &nbsp;",
		"Overall presentation format... &nbsp;",
		"Total &nbsp;"
	};

	public struct UserInfo
	{
		public int ID;
		public string first, middle, last;
		public string academicProgram, level;
		public string email, password;
		public string NID;
		public DateTime dateLastOn;
		public int loginCount, groupNumber, permissions;
	}

	static public string GetMd5Hash(byte[] dataIn)
	{
		MD5 md5Hash = MD5.Create();
		byte[] data = md5Hash.ComputeHash(dataIn);
		StringBuilder sBuilder = new StringBuilder();
		for (int i = 0; i < data.Length; i++)
		{
			sBuilder.Append(data[i].ToString("x2"));
		}
		return sBuilder.ToString();
	}

	static public string GetMd5Hash(string input)
	{
		MD5 md5Hash = MD5.Create();
		return( GetMd5Hash( md5Hash, input ) );
	}

	static public string GetMd5Hash(MD5 md5Hash, string input)
	{
		byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
		StringBuilder sBuilder = new StringBuilder();
		for (int i = 0; i < data.Length; i++)
		{
			sBuilder.Append(data[i].ToString("x2"));
		}
		return sBuilder.ToString();
	}

	static public string cleanString( string data )
	{
		return data.Trim().Replace("'","`").Replace(";","");
	}

	static public List<Utils.UserInfo> getUserList(SqlConnection connection, ref int startID, ref int endID, ref int userIDRange)
	{
		startID = 1000000;
		endID = -1;

		List<Utils.UserInfo> uiList = new List<UserInfo>();
		string sql = "select * from Users order by Last,First";
		SqlCommand command = new SqlCommand(sql, connection);
		SqlDataReader reader = command.ExecuteReader();
		while( reader.Read() )
		{
			Utils.UserInfo ui = new Utils.UserInfo();
			ui.ID = Convert.ToInt32(reader["ID"]);
			if (ui.ID < startID)
			{
				startID = ui.ID;
			}
			if (ui.ID > endID)
			{
				endID = ui.ID;
			}
			ui.first = Convert.ToString(reader["First"]);
			ui.middle = Convert.ToString(reader["Middle"]);
			ui.last = Convert.ToString(reader["Last"]);
			ui.NID = Convert.ToString(reader["NID"]);
			uiList.Add(ui);
		}
		reader.Close();

		userIDRange = endID - startID + 1;

		return uiList;
	}

	public struct RangeInfo
	{
		public int ID;
		public string startDate, endDate;
	}

	static public List<RangeInfo> getDateRangeList(SqlConnection connection, string table)
	{
		List<RangeInfo> rangeList = new List<RangeInfo>();
		string sql = String.Format("select * from {0} order by StartDate", table);
		SqlCommand command = new SqlCommand(sql, connection);
		SqlDataReader reader = command.ExecuteReader();
		while( reader.Read() )
		{
			RangeInfo ri = new RangeInfo();
			ri.ID = Convert.ToInt32(reader["ID"]);
			ri.startDate = Convert.ToDateTime(reader["StartDate"]).ToShortDateString();
			ri.endDate = Convert.ToDateTime(reader["EndDate"]).ToShortDateString();
			rangeList.Add(ri);
		}
		reader.Close();
		return rangeList;
	}

	static public string createRangeStringTableRow(List<Utils.RangeInfo> rangeList, int dateRangeID, int colspan)
	{
		foreach( RangeInfo ri in rangeList )
		{
			if( ri.ID == dateRangeID )
			{
				return createRangeStringTableRow(ri, colspan);
			}
		}
		return String.Empty;
	}

	static public string createRangeStringTableRow(Utils.RangeInfo ri, int colspan)
	{
		return String.Format("<tr><td colspan={3} align=center><b>{0} - {1} - Date Range ID:{2}</b></td></tr>\r\n", ri.startDate, ri.endDate, ri.ID, colspan);
	}

	static public string createResultForPeerReviewRow(List<Utils.UserInfo> uiList, int currentPeerID, int counter, int score, int count, int rangeID, int voterID )
	{
		int voteCount = 0;

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			string sql = String.Format("select COUNT(*) from PeerReview where VoterID={0} and DateRangeID={1}", voterID, rangeID );
			SqlCommand command = new SqlCommand(sql, connection);
			SqlDataReader reader = command.ExecuteReader();
			if( reader.Read() )
			{
				voteCount = Convert.ToInt32(reader[0]);
			}
			reader.Close();
		}
		catch
		{
		}
		finally
		{
			if( connection.State == ConnectionState.Open )
			{
				connection.Close();
			}
		}

		string name = Utils.getName(uiList, currentPeerID);
		string scr = ((float)score / (float)count).ToString("0.00");
		return String.Format("\r<tr><td style=\"padding:8px\">{2}</td><td style=\"padding:8px\" align=right>Name:</td><td style=\"padding:8px\">{0}</td><td style=\"padding:8px\"> &nbsp;</td><td style=\"padding:8px\">Average Score:</td><td style=\"padding:8px\">{1}</td><td style=\"padding:8px\">Vote Count:</td><td style=\"padding:8px\">{3}</td></tr>\r\n", name, scr, counter, voteCount);
	}

	static public string createResultForMeetingRow(List<Utils.UserInfo> uiList, int currentPeerID, int counter, int score, int count, int rangeID, int voterID, int iSaid)
	{
		int voteCount = 0;

		string name = Utils.getName(uiList, currentPeerID).Trim();
		if( name.Length == 0 )
		{
			return String.Empty;
		}

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			string sql = String.Format("select COUNT(*) from Meetings where VoterID={0} and DateRangeID={1} and VoterID<>PeerID", voterID, rangeID);
			SqlCommand command = new SqlCommand(sql, connection);
			SqlDataReader reader = command.ExecuteReader();
			if (reader.Read())
			{
				voteCount = Convert.ToInt32(reader[0]);
			}
			reader.Close();
		}
		catch
		{
		}
		finally
		{
			if (connection.State == ConnectionState.Open)
			{
				connection.Close();
			}
		}

//		string name = Utils.getName(uiList, currentPeerID);
		string scr = (((float)score / (float)count)*100.0).ToString("0.00");
		return String.Format("\r<tr><td style=\"padding:8px\">{2}</td><td style=\"padding:8px\" align=right>Name:</td><td style=\"padding:8px\">{0}</td><td style=\"padding:8px\"> &nbsp;</td><td style=\"padding:8px\">Average Score:</td><td style=\"padding:8px\">{1}%</td><td style=\"padding:8px\">Vote Count:</td><td style=\"padding:8px\">{3}</td><td>Attended:</td><td>{4}</td></tr>\r\n", name, scr, counter, voteCount, iSaid == 1 ? "Yes" : "No");
	}

	static public string getName(List<Utils.UserInfo> uiList, int peerID)
	{
		string ret = String.Empty;

		foreach (Utils.UserInfo ui in uiList)
		{
			if (ui.ID == peerID)
			{
				return ui.first + " " + ui.middle + " " + ui.last;
			}
		}

		return ret;
	}

	public static string createGroupHeading( int group )
	{
		return String.Format("<tr><td colspan=10>Group:{0}</td></tr>\r\n", group);
	}

	public static string startTable = "<table border=1>\r\n";
	public static string endAndRestartTable = "</table><br />\r\n<table border=1>\r\n";
	public static string endTable = "</table>\r\n";

	public static List<string> getDates(ref string error)
	{
		error = String.Empty;

		List<string> dates = new List<string>();

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			DateTime t = DateTime.Now.AddDays(1);
			DateTime tomorrow = new DateTime(t.Year, t.Month, t.Day);

			string sql = "select * from DatesAllowed order by ID";
			SqlCommand command = new SqlCommand(sql, connection);
			SqlDataReader reader = command.ExecuteReader();
			while (reader.Read())
			{
				DateTime dt = Convert.ToDateTime(reader["dt"]);
				string thisDate = String.Format("{0}-{1}-{2}", dt.Month, dt.Day, dt.Year);

				if (dt < tomorrow)
				{
					dates.Add(thisDate);
				}
			}
			reader.Close();

#if CRAP
			string sql = "select distinct dateTaken from PeerReview order by dateTaken";
			SqlCommand command = new SqlCommand(sql, connection);
			SqlDataReader reader = command.ExecuteReader();
			while (reader.Read())
			{
				DateTime dt = Convert.ToDateTime(reader["dateTaken"]);
				string thisDate = String.Format("{0}-{1}-{2}", dt.Month, dt.Day, dt.Year);
				dates.Add(thisDate);
			}
#endif
		}
		catch (Exception ex)
		{
			error = ex.Message.ToString();
		}
		finally
		{
			if (connection.State == ConnectionState.Open)
			{
				connection.Close();
			}
		}

		return dates;
	}

	static public List<Utils.UserInfo> loadUsers(ref string error)
	{
		error = String.Empty;

		List<Utils.UserInfo> list = new List<Utils.UserInfo>();

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			string sql = "select * from Users order by Last,First";
			SqlCommand command = new SqlCommand(sql, connection);
			SqlDataReader reader = command.ExecuteReader();
			while (reader.Read())
			{
				Utils.UserInfo ui = new Utils.UserInfo();
				ui.NID = Convert.ToString(reader["NID"]);
				ui.groupNumber = Convert.ToInt32(reader["Grp"]);
				ui.first = Convert.ToString(reader["First"]);
				ui.last = Convert.ToString(reader["last"]);
				ui.middle = Convert.ToString(reader["middle"]);
				ui.ID = Convert.ToInt32(reader["ID"]);
				list.Add(ui);
			}
			reader.Close();
		}
		catch (Exception ex)
		{
			error = ex.Message.ToString();
		}
		finally
		{
			if (connection.State == ConnectionState.Open)
			{
				connection.Close();
			}
		}

		return list;
	}

}
