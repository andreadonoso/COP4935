<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="Attendance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="font-size: 30px;">
    <form id="form1" runat="server">
	<center>
	<h1>Attendance</h1>
	<div>
		<asp:Literal runat="server" ID="litAttendance" />
	</div>
	<asp:Label runat="server" ID="lblError" ForeColor="Salmon" />
	</center>
    </form>
</body>
</html>
