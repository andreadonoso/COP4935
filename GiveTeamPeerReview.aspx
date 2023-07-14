<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GiveTeamPeerReview.aspx.cs" Inherits="GiveTeamPeerReview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>COP 4935 Give Team Peer Review</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: lightblue; width: 100%; height: 100%; position: absolute; top: 0; left: 0; text-align: center;">
		<h1>Give Team Peer Review</h1>
		<div style="background-color: #ffffee; width:700px; height: 304px; margin: auto; border-radius: 25px;">
			<asp:Label ID="lblGroupNumber" runat="server" Text="Group NUmber:" />
			<br />
			<br />
			<asp:Label Style="text-align: left;" Width="500px" Visible="false" ID="lblUserName1" runat="server" Text="John Doe 1" /><asp:TextBox Visible="false" Columns="3" ID="txtPeerReview1" runat="server" /><asp:RangeValidator runat="server" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txtPeerReview1" ErrorMessage="Values 0-10" /><br />
			<asp:Label Style="text-align: left;" Width="500px" Visible="false" ID="lblUserName2" runat="server" Text="John Doe 2" /><asp:TextBox Visible="false" Columns="3" ID="txtPeerReview2" runat="server" /><asp:RangeValidator runat="server" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txtPeerReview2" ErrorMessage="Values 0-10" /><br />
			<asp:Label Style="text-align: left;" Width="500px" Visible="false" ID="lblUserName3" runat="server" Text="John Doe 3" /><asp:TextBox Visible="false" Columns="3" ID="txtPeerReview3" runat="server" /><asp:RangeValidator runat="server" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txtPeerReview3" ErrorMessage="Values 0-10" /><br />
			<asp:Label Style="text-align: left;" Width="500px" Visible="false" ID="lblUserName4" runat="server" Text="John Doe 4" /><asp:TextBox Visible="false" Columns="3" ID="txtPeerReview4" runat="server" /><asp:RangeValidator runat="server" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txtPeerReview4" ErrorMessage="Values 0-10" /><br />
			<asp:Label Style="text-align: left;" Width="500px" Visible="false" ID="lblUserName5" runat="server" Text="John Doe 5" /><asp:TextBox Visible="false" Columns="3" ID="txtPeerReview5" runat="server" /><asp:RangeValidator runat="server" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txtPeerReview5" ErrorMessage="Values 0-10" /><br />
			<asp:Label Style="text-align: left;" Width="500px" Visible="false" ID="lblUserName6" runat="server" Text="John Doe 6" /><asp:TextBox Visible="false" Columns="3" ID="txtPeerReview6" runat="server" /><asp:RangeValidator runat="server" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txtPeerReview6" ErrorMessage="Values 0-10" /><br />
			<asp:Label Style="text-align: left;" Width="500px" Visible="false" ID="lblUserName7" runat="server" Text="John Doe 7" /><asp:TextBox Visible="false" Columns="3" ID="txtPeerReview7" runat="server" /><asp:RangeValidator runat="server" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txtPeerReview7" ErrorMessage="Values 0-10" /><br />
			<asp:Label Style="text-align: left;" Width="500px" Visible="false" ID="lblUserName8" runat="server" Text="John Doe 8" /><asp:TextBox Visible="false" Columns="3" ID="txtPeerReview8" runat="server" /><asp:RangeValidator runat="server" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txtPeerReview8" ErrorMessage="Values 0-10" /><br />
			<asp:Label Style="text-align: left;" Width="500px" Visible="false" ID="lblUserName9" runat="server" Text="John Doe 9" /><asp:TextBox Visible="false" Columns="3" ID="txtPeerReview9" runat="server" /><asp:RangeValidator runat="server" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txtPeerReview9" ErrorMessage="Values 0-10" />
			
			<br />
			<asp:Label ID="lblError" runat="server" ForeColor="Salmon" />
			<br />
			<asp:Button CausesValidation="true" Width="300" ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
			<br />
			<br />
			<asp:Button CausesValidation="false" Width="300" ID="btnBackToLandingPage" runat="server" Text="Back To Landing Page" OnClick="btnBackToLandingPage_Click" />
		</div>
    </div>
    </form>
</body>
</html>

