<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>COP 4935 Admin</title>

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
		<h1>Administration</h1>
		<div style="background-color: #ffffff; width:500px; height: 280px; margin: auto; border-radius: 25px;" id="mainBox">
			<br /><br />
			<center>
				<asp:Button ID="btnUsers" Width="173px" Text="Users" runat="server" OnClick="btnUsers_Click" /><br /><br />
				<asp:Button ID="btnReports" Width="173px" Text="Reports" runat="server" OnClick="btnReports_Click" /><br /><br />
				<asp:Button ID="btnCDRDates" Width="173px" Text="CDR Dates" runat="server" OnClick="btnCDRDates_Click" /><br /><br />
				<asp:Button ID="btnLandingPage" Width="173px" Text="Landing Page" runat="server" OnClick="btnLandingPage_Click" /><br /><br />
				<asp:Button ID="btnLogOut" Width="173px" Text="Log Out" runat="server" OnClick="btnLogOut_Click" /><br /><br />
			</center>
		</div>
    </div>
    </form>
</body>
</html>
