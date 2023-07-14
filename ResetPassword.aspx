<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="font-size: 25px;">
    <form id="form1" runat="server">
    <div>
    
		<center>
			<br /><br />
		<asp:Panel ID="pnlTable" runat="server" Visible="false">
			<table>
				<tr>
					<td colspan="3" align="center">Enter Your New Password and Confirm</td>
				</tr>
				<tr>
					<td align="right">Password: </td>
					<td> &nbsp;</td>
					<td><asp:TextBox id="txtPassword" runat="server" TextMode="Password" /></td>
				</tr>
				<tr>
					<td align="right">Confirm Password: </td>
					<td> &nbsp;</td>
					<td><asp:TextBox id="txtConfirmPassword" runat="server" TextMode="Password" /></td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td align="center"><asp:Button runat="server" Font-Size="Larger" ID="btnReset" Text="Reset" OnClick="btnReset_Click" /></td>
					<td> &nbsp;</td>
					<td align="center"><asp:Button runat="server" Font-Size="Larger" ID="btnToLogin" Text="To Login" Enabled="false" OnClick="btnToLogin_Click" /></td>
				</tr>
			</table>
		</asp:Panel>

		<br />
		<br />
    
		<asp:Label id="lblError" runat="server" Font-Size="Larger" Text="" ForeColor="Salmon" />
		</center>
    </div>
    </form>
</body>
</html>
