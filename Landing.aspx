<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Landing.aspx.cs" Inherits="Landing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>COP 4935 Landing</title>

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
		<h1>Greetings</h1>
		<h3>It is another day in paradise</h3>
		<asp:Literal runat="server" ID="litBoxDiv" />
			<br />
			<center>
				<table border="1">
					<tr><td align="right" style="padding:10px">Name: </td><td style="padding:10px"><asp:Label runat="server" ID="lblFirst" /> <asp:Label runat="server" ID="lblMiddle" /> <asp:Label runat="server" ID="lblLast" /></td></tr>
					<tr><td align="right" style="padding:10px">Level: </td><td style="padding:10px"><asp:Label runat="server" ID="lblLevel" /></td></tr>
					<tr><td align="right" style="padding:10px">Program: </td><td style="padding:10px"><asp:Label runat="server" ID="lblProgram" /></td></tr>
					<tr><td align="right" style="padding:10px">Date Last On: </td><td style="padding:10px"><asp:Label runat="server" ID="lblDateLastOn" /></td></tr>
					<tr><td align="right" style="padding:10px">Login Count: </td><td style="padding:10px"><asp:Label runat="server" ID="lblLoginCount" /></td></tr>
					<tr><td align="right" style="padding:10px">Group Number: </td><td style="padding:10px"><asp:Label runat="server" ID="lblGroupNumber" /></td></tr>
				</table>
			</center>
			<br />
			<asp:Button ID="btnLogOut" runat="server" Text="Log Out" Width="200px" OnClick="btnLogOut_Click" />
			<br />
			<br />
			<asp:Button ID="btnChangePassword" Width="200px" runat="server" Text="Change Password" OnClick="btnChangePassword_Click" />
			<br />
			<br />
			<asp:Button ID="btnPeerReview" runat="server" Text="CDR Peer Review" Width="200px" OnClick="btnPeerReview_Click" />
			<br />
			<br />
			<asp:Button ID="btnChangeGroup" runat="server" Text="Change Group" Width="200px" OnClick="btnCHangeGroup_Click" />
			<br />
			<br />
			<asp:Button ID="btnSeeMyGroupsPeerReview" runat="server" Text="See Our CDR Peer Review" Width="200px" OnClick="btnSeeMyGroupsPeerReview_Click" />
			<br />
			<br />
			<asp:Button ID="btnGiveGroupReview" runat="server" Text="Give Team Peer Review" Width="200px" OnClick="btnGiveGroupPeerReview_Click" />
			<br />
			<br />
			<asp:Button ID="btnAdmin" runat="server" Text="Admin" Width="200px" OnClick="btnAdmin_Click" />
			<br />
			<asp:Label runat="server" ID="lblError" ForeColor="Salmon" />
		</div>
    </div>
    </form>
</body>
</html>
