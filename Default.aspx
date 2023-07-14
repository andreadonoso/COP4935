<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>COP 4935 Meeting Check In and Peer Review</title>

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
		<h1>Please login</h1>
		<div style="background-color: #eeeeee; width:500px; height: 300px; margin: auto; border-radius: 25px;">
			<br /><br /><br /><br />
			<center>
				<table>
					<tr><td align="right">Email:</td><td><asp:TextBox runat="server" ID="txtEmail" /></td></tr>
					<tr><td colspan="2">&nbsp;</td></tr>
					<tr><td align="right">Password:</td><td><asp:TextBox runat="server" ID="txtPassword" TextMode="Password" /></td></tr>
					<tr><td colspan="2">&nbsp;</td></tr>
					<tr><td colspan="2" align="center"><asp:Button runat="server" ID="btnLogin" Text="Login" OnClick="btnLogin_Click" /></td></tr>
					<tr><td colspan="2" align="center"><asp:Label runat="server" ID="lblError" Text="" ForeColor="salmon" /></td></tr>
				</table>
			</center>
			<br /><br /><br />
			<center>
				<a href="Forgot.aspx">Forgot Password</a>
			</center>
		</div>
    </div>
    </form>
</body>
</html>
