<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TeamMeetings.aspx.cs" Inherits="TeamMeetings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>COP 4935 Team Meetings</title>

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
		<h1>Team Meetings</h1>
		<div style="background-color: #00ffff; width:640px; height: 510px; margin: auto; border-radius: 25px;" id="mainBox">
			<center>
				<asp:Literal ID="litListOfRanges" runat="server"  />
				<asp:Label ID="lblMessage" runat="server" ForeColor="#ff0000" Font-Size="Large" />

				<table align="center">
					<tr><td align="right"><asp:Label ID="lblRadioLabel0" runat="server" Font-Size="Large" /></td><td> &nbsp;&nbsp;</td><td><asp:RadioButtonList ID="rbtnList0" Font-Size="Large" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Height="20px" Width="328px" Visible="false" /></td></tr>
					<tr><td align="right"><asp:Label ID="lblRadioLabel1" runat="server" Font-Size="Large" /></td><td> &nbsp;&nbsp;</td><td><asp:RadioButtonList ID="rbtnList1" Font-Size="Large" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Height="20px" Width="328px" Visible="false" /></td></tr>
					<tr><td align="right"><asp:Label ID="lblRadioLabel2" runat="server" Font-Size="Large" /></td><td> &nbsp;&nbsp;</td><td><asp:RadioButtonList ID="rbtnList2" Font-Size="Large" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Height="20px" Width="328px" Visible="false" /></td></tr>
					<tr><td align="right"><asp:Label ID="lblRadioLabel3" runat="server" Font-Size="Large" /></td><td> &nbsp;&nbsp;</td><td><asp:RadioButtonList ID="rbtnList3" Font-Size="Large" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Height="20px" Width="328px" Visible="false" /></td></tr>
					<tr><td align="right"><asp:Label ID="lblRadioLabel4" runat="server" Font-Size="Large" /></td><td> &nbsp;&nbsp;</td><td><asp:RadioButtonList ID="rbtnList4" Font-Size="Large" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Height="20px" Width="328px" Visible="false" /></td></tr>
					<tr><td align="right"><asp:Label ID="lblRadioLabel5" runat="server" Font-Size="Large" /></td><td> &nbsp;&nbsp;</td><td><asp:RadioButtonList ID="rbtnList5" Font-Size="Large" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Height="20px" Width="328px" Visible="false" /></td></tr>
					<tr><td align="right"><asp:Label ID="lblRadioLabel6" runat="server" Font-Size="Large" /></td><td> &nbsp;&nbsp;</td><td><asp:RadioButtonList ID="rbtnList6" Font-Size="Large" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Height="20px" Width="328px" Visible="false" /></td></tr>
					<tr><td align="right"><asp:Label ID="lblRadioLabel7" runat="server" Font-Size="Large" /></td><td> &nbsp;&nbsp;</td><td><asp:RadioButtonList ID="rbtnList7" Font-Size="Large" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Height="20px" Width="328px" Visible="false" /></td></tr>
					<tr><td align="right"><asp:Label ID="lblRadioLabel8" runat="server" Font-Size="Large" /></td><td> &nbsp;&nbsp;</td><td><asp:RadioButtonList ID="rbtnList8" Font-Size="Large" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Height="20px" Width="328px" Visible="false" /></td></tr>
					<tr><td align="right"><asp:Label ID="lblRadioLabel9" runat="server" Font-Size="Large" /></td><td> &nbsp;&nbsp;</td><td><asp:RadioButtonList ID="rbtnList9" Font-Size="Large" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Height="20px" Width="328px" Visible="false" /></td></tr>
				</table>
				<br />
				<asp:Button runat="server" ID="btnSave" Text=" Save " Enabled="False" ForeColor="#666699" OnClick="btnSave_Click" />
				&nbsp;
				<asp:Button runat="server" ID="btnCancel" Text=" Back " OnClick="btnCancel_Click" />
				<br />
				<asp:Label ID="lblInfo" runat="server" Font-Size="Larger"></asp:Label>
			</center>
		</div>
		<br />
    </div>
    </form>
</body>
</html>
