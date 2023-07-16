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
	<div style="background: linear-gradient(243.15deg, #AFD8E5 0.39%, #2B82C0 99.15%); width: 100%; height: 100%; position: absolute; top: 0; left: 0; text-align: center; padding: 100px">
		<h1></h1>
		<div style="background: rgba(0,0,0,0.19); width: 558px; height: 580px; top: 50%; left: 50%; margin: auto; border-radius: 20px; padding: 10px;">
			<center>
				<table>
                	<tr><h1 style="color: #FFFFFF; width: 558px; height: 54px; top: 371px; left: 441px; font-size: 48px; font-weight: 900; line-height: 54px; letter-spacing: 0em; text-align: center;">Login</h1></tr>
					<tr><label for="txtEmail" style = "color: white; float: left; padding-left: 94px; padding-top: 50px ">Email<label style = "color: red">*</label></label></tr>
                    <tr><input type="text" runat="server" id="txtEmail" style="background: #00000030; width: 422px; height: 64px; top: 499px; left: 510px; border-radius: 10px; border: none" placeholder = "nid@ucf.edu" /></tr>
					<tr><label for="txtPassword" style = "color: white; float: left; padding-left: 94px; padding-top: 50px ">Password<label style = "color: red">*</label></label></tr>
  					<tr><input type="text" runat="server" id="txtPassword" style="background: #00000030; width: 422px; height: 64px; top: 499px; left: 510px; border-radius: 10px; border: none"/></tr>
					<tr><td colspan="2">&nbsp;</td></tr>
                    <tr><td colspan="2" align="center" style = "padding: 30px"><input type="button" id="btnLogin" value="Login" onclick="btnLogin_Click" style = "color: white; background: #000000; width: 164px; height: 46px; top: 616px; left: 639px; border-radius: 10px; border: none"/></td></tr>
					<tr><td colspan="2" align="center"><asp:Label runat="server" ID="lblError" Text="" ForeColor="salmon" /></td></tr>
				</table>
			</center>
			<center>
				<a href="Forgot.aspx" style="color:white">Forgot Password</a>
			</center>
		</div>
    </div>
    </form>
</body>
</html>