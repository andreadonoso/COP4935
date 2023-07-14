<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AllMeetings.aspx.cs" Inherits="AllMeetings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="font-size:20px">
		<center>
			<asp:Label runat="server" ID="lblError" ForeColor="Salmon" Font-Size="Large" Visible="false" />
			<asp:Literal runat="server" ID="litResults" Visible="false" />
		</center>
    </div>
    </form>
</body>
</html>
