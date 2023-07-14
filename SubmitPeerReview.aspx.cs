using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using Newtonsoft.Json;
using System.Data;
using System.Data.SqlClient;

public partial class SubmitPeerReview : System.Web.UI.Page
{

	public struct PeerReviewReq
	{
		public int dateID;
		public int total1, total2, total3, total4;
		public string parts;
		public string dateTaken;
		public string NID;
		public string groups;
		public string comments;
	}

	public struct PeerReviewRes
	{
		public string error;
	}

    protected void Page_Load(object sender, EventArgs e)
    {
		PeerReviewReq req = new PeerReviewReq();
		PeerReviewRes res = new PeerReviewRes();
		res.error = String.Empty;

		try
		{
			req = GetRequestInfo();
		}
		catch (Exception ex)
		{
			res.error = ex.Message.ToString();

			// Return the results as Json.
			SendResultInfoAsJson(res);

			return;
		}

		req.comments = req.comments.Replace("'", "`").Replace(";", "");

		SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
		try
		{
			connection.Open();

			string sql = String.Format("select * from PeerReview where NID='{0}' and dateTaken='{1}'", req.NID, req.dateTaken );
			SqlCommand command = new SqlCommand(sql, connection);
			SqlDataReader reader = command.ExecuteReader();
			bool found = false;
			if( reader.Read() )
			{
				found = true;
			}
			reader.Close();

			if (found)
			{
				res.error = "This NID for this date has already submitted peer review.";
			}
			else
			{
				sql = String.Format("insert into PeerReview (total1,total2,total3,total4,parts,dateTaken,NID,groups,comments) VALUES ({0},{1},{2},{3},'{4}','{5}','{6}','{7}','{8}')",
					req.total1, req.total2, req.total3, req.total4, req.parts, req.dateTaken, req.NID, req.groups, req.comments);
				command = new SqlCommand(sql, connection);
				command.ExecuteNonQuery();
			}
		}
		catch (Exception ex)
		{
			res.error = ex.Message.ToString();
		}
		finally
		{
			if (connection.State == ConnectionState.Open)
			{
				connection.Close();
			}
		}

		SendResultInfoAsJson(res);
    }

	PeerReviewReq GetRequestInfo()
	{
		// Get the Json from the POST.
		string strJson = String.Empty;
		HttpContext context = HttpContext.Current;
		context.Request.InputStream.Position = 0;
		using (StreamReader inputStream = new StreamReader(context.Request.InputStream))
		{
			strJson = inputStream.ReadToEnd();
		}

		// Deserialize the Json.
		PeerReviewReq req = JsonConvert.DeserializeObject<PeerReviewReq>(strJson);

		return (req);
	}

	void SendResultInfoAsJson(PeerReviewRes res)
	{
		string strJson = JsonConvert.SerializeObject(res);
		Response.ContentType = "application/json; charset=utf-8";
		Response.Write(strJson);
		Response.End();
	}

}