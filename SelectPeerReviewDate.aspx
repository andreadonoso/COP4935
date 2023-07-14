<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SelectPeerReviewDate.aspx.cs" Inherits="SelectPeerReviewDate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>COP 4935 Select Peer Review Date</title>

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
		<h1>Select Date</h1>
		<div style="background-color: #ffffee; width:500px; height: 200px; margin: auto; border-radius: 25px;">
			<br />
			<center>
				<asp:ListBox ID="lstPeerDates" width="300" runat="server" AutoPostBack="true" OnSelectedIndexChanged="lstPeerDates_SelectedIndexChanged"></asp:ListBox>
				<br /><asp:Label ID="lblError" runat="server" ForeColor="salmon" />
			</center>
			<br />
			<asp:Button ID="btnBackToLandingPage" runat="server" Text="Cancel" OnClick="btnBackToLandingPage_Click" />
		</div>
    </div>
    </form>
</body>
</html>
