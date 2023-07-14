<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CDRDates.aspx.cs" Inherits="CDRDates" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit CDR Dates</title>
</head>
<body style="font-size: 24px;">
    <form id="form1" runat="server">
    <div>
		<center>
		<h1>CDR Dates</h1>
    	<asp:TextBox ID="txtCDRDates" runat="server" Height="502px" Font-Size="Larger" TextMode="MultiLine" Width="885px"></asp:TextBox>
    	<p>&nbsp;</p>
		<asp:Button ID="btnSave" runat="server" Font-Size="Larger" Text="Save" OnClick="btnSave_Click" />
		&nbsp;&nbsp;
		<asp:Button ID="btnCancel" runat="server" Font-Size="Larger" Text="Back" OnClick="btnCancel_Click" /><br />
		<asp:Label runat="server" ID="lblError" Text="" ForeColor="salmon" />
		</center>
    </div>
    </form>
</body>
</html>
