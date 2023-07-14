<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Users.aspx.cs" Inherits="Users" %>

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

<script>
	function UserDeleteConfirmation()
	{
		return confirm("Are you sure you want to delete this user?");
	}
</script>

</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: lightblue; width: 100%; height: 100%; position: absolute; top: 0; left: 0; text-align: center;">
		<h1>Users</h1>
		<div style="background-color: #feefff; width:500px; height: 355px; margin: auto; border-radius: 25px;" id="mainBox">
			<br />
			<center>
				<table>
					<tr><td align="right">First Name:</td><td><asp:TextBox ID="txtFirst" runat="server" Width="263px" /></td></tr>
					<tr><td align="right">Middle Name:</td><td><asp:TextBox ID="txtMiddle" runat="server" Width="263px" /></td></tr>
					<tr><td align="right">Last Name:</td><td><asp:TextBox ID="txtLast" runat="server" Width="263px" /></td></tr>
					<tr><td align="right">Email:</td><td><asp:TextBox ID="txtEmail" runat="server" Width="263px" /></td></tr>
					<tr><td align="right">Permissions:</td><td><asp:TextBox ID="txtPermissions" runat="server" Width="263px" /></td></tr>
					<tr><td align="right">Level:</td><td><asp:TextBox ID="txtLevel" runat="server" Width="263px" /></td></tr>
					<tr><td align="right">Academic Plan:</td><td><asp:TextBox ID="txtAcademicPlan" runat="server" Width="263px" /></td></tr>
					<tr><td align="right">Group:</td><td><asp:TextBox ID="txtGroup" runat="server" Width="263px" /></td></tr>
					<tr><td align="right">Password:</td><td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="263px" /></td></tr>
					<tr><td align="right">Confirm Password:</td><td><asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" Width="263px" /></td></tr>
					<tr><td colspan="2" align="center"><br /><asp:Button ID="btnSave" Text="Save" runat="server" OnClick="btnSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnCancel" Text="Cancel" runat="server" OnClick="btnCancel_Click" />&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnChangePassword" Text="Change Password" runat="server" OnClick="btnChangePassword_Click" />&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnNew" Text="New" runat="server" OnClick="btnNew_Click" />&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnDelete" Text="Delete" runat="server" OnClick="btnDelete_Click" OnClientClick="if ( ! UserDeleteConfirmation()) return false;" /></td></tr>
					<tr><td colspan="2" align="center"><asp:Label runat="server" ID="lblError" Font-Size="Large" ForeColor="salmon"/></td></tr>
				</table>
			</center>
		</div>
		<br />
		<div style="background-color: #feefff; width:500px; height: 400px; margin: auto; border-radius: 25px;" id="mainBox2">
			<br /><br />
			<center>
				<table>
					<tr><td align="center" colspan="2">Search for User</td></tr>
					<tr><td align="right">Search Criteria:</td><td><asp:TextBox ID="txtSearchCriteria" runat="server" Width="263px" /></td></tr>
					<tr><td colspan="2" align="center"><br /><asp:Button ID="btnSearch" Text="Search" runat="server" OnClick="btnSearch_Click" /></td></tr>
					<tr><td colspan="2"><br />&nbsp;</td></tr>
					<tr><td colspan="2" align="center"><asp:ListBox ID="lstSearchResults" runat="server" Width="350px" Height="170px" OnSelectedIndexChanged="lstSearchResults_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox></td></tr>
					<tr><td colspan="2" align="center"><asp:Label runat="server" ID="lblError2" Font-Size="Large" ForeColor="salmon"/></td></tr>
				</table>
			</center>
		</div>
    </div>
    </form>
</body>
</html>
