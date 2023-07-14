<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PeerReview.aspx.cs" Inherits="PeerReview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>COP 4331 Peer Review</title>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="PeerReview.css">

</head>

<body style="font-size: 24px;">
    <form id="form1" runat="server">
	<div>
		<center>
		<h1>Peer Review</h1>
		<asp:Literal runat="server" ID="litPeerReview" /><br />
		<asp:Button runat="server" ID="btnBackToAdmin" Text="Back to Admin" OnClick="btnBackToAdmin_Click" /><br />
		<asp:Label runat="server" ID="lblError" Text="" ForeColor="salmon" />
		</center>
    </div>
    </form>
</body>
</html>
