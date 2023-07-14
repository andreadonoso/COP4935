<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Forgot.aspx.cs" Inherits="Forgot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>COP 4935 Forgot Password</title>

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
		<h1>Password Recovery</h1>
		<div style="background-color: #eeeeee; width: 750px; height: 200px; margin: auto; border-radius: 25px;">
			<br /><br /><br />
			<center>
				<table>
					<tr><td align="right">Your Email:</td><td><asp:TextBox runat="server" Columns="80" ID="txtEmail" /></td></tr>
					<tr><td colspan="2">&nbsp;</td></tr>
					<tr><td colspan="2" align="center"><asp:Button runat="server" ID="btnRecover" Text="Start Recovery" OnClick="btnRecover_Click" />&nbsp;&nbsp;&nbsp; <asp:Button Enabled="false" runat="server" ID="btnBack" Text="Back To Login" OnClick="btnBack_Click" /></td></tr>
					<tr><td colspan="2" align="center"><asp:Label runat="server" ID="lblError" Text="" ForeColor="salmon" /></td></tr>
				</table>
			</center>
			<br /><br />
		</div>
    </div>
    </form>
</body>
</html>
