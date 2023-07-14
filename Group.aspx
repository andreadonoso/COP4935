<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Group.aspx.cs" Inherits="Group" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>COP 4935 Change Group</title>

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
		<h1>Change Group</h1>
		<div style="background-color: #ffffee; width:500px; height: 216px; margin: auto; border-radius: 25px;">
			<br />
			<center>
				<table border="1">
					<tr><td align="right" style="padding:10px">New Group: </td><td style="padding:10px"><asp:TextBox runat="server" ID="txtGroup" Width="200px" /></td></tr>
					<tr><td align="center" colspan="2" style="padding:10px"><asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" /><br /><asp:Label ID="lblError" runat="server" ForeColor="salmon" /></td></tr>
				</table>
			</center>
			<br />
			<asp:Button ID="btnBackToLandingPage" runat="server" Text="Back To Landing Page" OnClick="btnBackToLandingPage_Click" />
		</div>
    </div>
    </form>
</body>
</html>

