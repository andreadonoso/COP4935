<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PeerReviewSelectedUser.aspx.cs" Inherits="PeerReviewSelectedUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<asp:ListBox ID="lstDateRanges" runat="server" Width="613px" AutoPostBack="True" OnSelectedIndexChanged="lstDateRanges_SelectedIndexChanged" Height="327px"></asp:ListBox>
		<center>
			<asp:Label runat="server" ID="lblError" ForeColor="Salmon" Font-Size="Large" Visible="false" />
			<asp:Literal runat="server" ID="litResults" Visible="false" />
		</center>
    </div>
    </form>
</body>
</html>
