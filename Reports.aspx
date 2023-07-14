﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>COP 4935 Admin Reports</title>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: lightblue; width: 100%; height: 100%; position: absolute; top: 0; left: 0; text-align: center;">
		<h1>Reports</h1>
		<div style="background-color: #ffdddd; width:500px; height: 200px; margin: auto; border-radius: 25px;">
			<br />
			<center>
				<table>
					<tr><td align="center" style="padding:10px"><asp:Button runat="server" ID="btnPeerReview" Text="Peer Review" Width="325px" OnClick="btnPeerReview_Click" /></td></tr>
					<tr><td align="center" style="padding:10px"><asp:Button runat="server" ID="btnAttendance" Text="Attendance" Width="325px" OnClick="btnAttendance_Click" /></td></tr>
				</table>
			</center>
			<br />
			<asp:Button ID="btnBackToLandingPage" runat="server" Text="Back To Landing Page" OnClick="btnBackToLandingPage_Click" />
		</div>
    </div>
    </form>
</body>
</html>

