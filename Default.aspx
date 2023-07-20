<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<style>
		input::placeholder {
		opacity: 0.5;
		color: white;
		padding-left: 10px;
		}
		/* Style for email and password input fields */
		input[type="email"],input[type="password"] {
			background: #CCCCCC; /* Gray background color */
			width: 75%;
			height: 40px;
			color: #FFFFFF;
			border-radius: 10px;
			border: none;
			margin: 0 auto;
			padding: 5px 10px;
		}
	</style>

    <title>COP 4935 Meeting Check In and Peer Review</title>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<body>
    <form id="form1" runat="server">
	<div style="background: linear-gradient(243.15deg, #AFD8E5 0.39%, #2B82C0 99.15%); position: absolute; top: 0; left: 0; width: 100%; height: 100vh; display: flex; justify-content: center; align-items: center;">
		<div style = "position: absolute; top: 10px; left: 10px;">
			<img src="palm-tree.png" alt= "Palm Tree Logo" width="50" height="50">
		</div>
		<div style="background: rgba(0,0,0,0.19); width: 75%; max-width: 558px; height: 487px; margin: auto; border-radius: 20px;">
			<br /><br /><br />
			<center>
				<table style="width: 100%;">
                	<tr>
						<td colspan="2" style="text-align: center;">
						  <h1 style="font-family: Arial, Helvetica, sans-serif; color: #FFFFFF; font-size: 35px; width: 75%; font-weight: 900; line-height: 34px; letter-spacing: 0em; margin: 0 auto; padding-bottom: 10px;">Login</h1>
						</td>
					</tr>

					<tr>
						<td colspan="2" align="center" style="padding: 20px 30px;">
						  <label for="txtEmail" style="font-family: sans-serif; color: white; margin-bottom: 10px;padding-right: 55%;">Email<label style="color: red">*</label></label><br>
						  <asp:TextBox ID="txtEmail" runat="server" style="background: #00000030; width: 75%; height: 40px; color:#FFFFFF; border-radius: 10px; border: none; margin: 0 auto;" placeholder="nid@ucf.edu" />
						</td>
					</tr>

					<tr>
						<td colspan="2" align="center" style="padding: 20px 30px;">
						  <label for="txtPassword" style="font-family: sans-serif; color: white; margin-bottom: 10px;padding-right: 55%;">Password<label style="color: red">*</label></label><br>
						  <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" style="background: #00000030; width: 75%; height: 40px; color:#FFFFFF; border-radius: 10px; border: none; margin: 0 auto;"/>
						</td>
					</tr>

					<tr>
						<td colspan="2" align="center" style="padding: 20px;">
						  <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" style="color: white; background: #000000; width: 30%; height: 40px; border-radius: 10px; border: none" />
						</td>
					</tr>

					<tr>
						<td colspan="2" align="center">
						  <asp:Label runat="server" ID="lblError" Text="" ForeColor="salmon" />
						</td>
					</tr>  
				</table>
			</center>
			<center>
				<a href="Forgot.aspx" style="color:white">Forgot Password</a>
			</center>
			<br /><br />
		</div>
    </div>
    </form>
</body>
</html>