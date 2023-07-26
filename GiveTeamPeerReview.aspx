<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GiveTeamPeerReview.aspx.cs" Inherits="GiveTeamPeerReview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<style>
		input::placeholder {
		opacity: 0.5;
		color: white;
		padding-left: 10px;
		}
	</style>

    <title>COP 4935 Give Team Peer Review</title>

</head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<body>
    <form id="form1" runat="server">
	<div style="background: linear-gradient(243.15deg, #AFD8E5 0.39%, #2B82C0 99.15%); position: absolute; top: 0; left: 0; width: 100%; height: 100vh; display: flex; justify-content: center; align-items: center;">
		<div style = "position: absolute; top: 10px; left: 10px;">
			<img src="palm-tree.png" alt= "Palm Tree Logo" width="50" height="50">
		</div>
		<div style="background: rgba(0,0,0,0.19); width: 75%; max-width: 558px; height: 487px; margin: auto; border-radius: 20px;">
		<center>
		<br><br>
		<h1 style="font-family: Arial, Helvetica, sans-serif; color: #FFFFFF; font-size: 35px; width: 90%; font-weight: 900; line-height: 34px; letter-spacing: 0em; margin: 0 auto; padding-bottom: 10px;">Give Team Peer Review</h1>
			<div style="margin: 10px; width: 92%;  height: 30vh; overflow-y: overlay; ">
<style>
::-webkit-scrollbar{width:5px; height: 30vh; background-color: transparent;}
::-webkit-scrollbar-track{background-color: transparent; border-radius: 10px; -webkit-box-shadow:inset 0 0 6px rgba(0,0,0,0.3);}
::-webkit-scrollbar-thumb{border-radius:10px; -webkit-box-shadow:inset 0 0 6px rgba(0,0,0,.3); background-color:rgba(0,0,0,0.19);}
</style>
			<table style="background: rgba(0,0,0,0.19); border-spacing: 0px; border-collapse: collapse;">
				<tr>
					<td colspan="2" style="text-align: center;padding: 20px 30px; width: 50%;">
						<asp:Label ID="lblGroupNumber" runat="server" Text="Group Number:" style="font-family: sans-serif; color: white; margin-bottom: 10px; padding-right: 10%;"/>
					</td>
				</tr>
				<tr>
					<td style="text-align: left;padding: 10px 10px 10px 40px; width: 65%;">
						<asp:Label Style="font-family: sans-serif; color: white; margin-bottom: 10px; padding-right: 10%;" Visible="false" ID="lblUserName1" runat="server" Text="John Doe 1" />
					</td>
					<td style="text-align: right;">
						<asp:TextBox Visible="false" Columns="3" ID="txtPeerReview1" runat="server" style="background: #00000030; width: 35%; height: 30px; color:#FFFFFF; border-radius: 10px; border: none; margin: 0 auto;"/><asp:RangeValidator runat="server" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txtPeerReview1" ErrorMessage="Values 0-10" />
					</td>
				</tr>

				<tr>
					<td style="text-align: left;padding: 10px 10px 10px 40px; width: 65%;">
						<asp:Label Style="font-family: sans-serif; color: white; margin-bottom: 10px;" Visible="false" ID="lblUserName2" runat="server" Text="John Doe 2" />
					</td>
					<td style="text-align: right;">
						<asp:TextBox Visible="false" Columns="3" ID="txtPeerReview2" runat="server" style="background: #00000030; width: 35%; height: 30px; color:#FFFFFF; border-radius: 10px; border: none; margin: 0 auto;"/><asp:RangeValidator runat="server" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txtPeerReview2" ErrorMessage="Values 0-10" />
					</td>
				</tr>

				<tr>
					<td style="text-align: left;padding: 10px 10px 10px 40px; width: 65%;">
						<asp:Label Style="font-family: sans-serif; color: white; margin-bottom: 10px;" Visible="false" ID="lblUserName3" runat="server" Text="John Doe 3" />
					</td>
					<td style="text-align: right;">
						<asp:TextBox Visible="false" Columns="3" ID="txtPeerReview3" runat="server" style="background: #00000030; width: 35%; height: 30px; color:#FFFFFF; border-radius: 10px; border: none; margin: 0 auto;"/><asp:RangeValidator runat="server" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txtPeerReview3" ErrorMessage="Values 0-10" />
					</td>
				</tr>

				<tr>
					<td style="text-align: left;padding: 10px 10px 10px 40px; width: 65%;">
						<asp:Label Style="font-family: sans-serif; color: white; margin-bottom: 10px;" Visible="false" ID="lblUserName4" runat="server" Text="John Doe 4" />
					</td>
					<td style="text-align: right;">
						<asp:TextBox Visible="false" Columns="3" ID="txtPeerReview4" runat="server" style="background: #00000030; width: 35%; height: 30px; color:#FFFFFF; border-radius: 10px; border: none; margin: 0 auto;"/><asp:RangeValidator runat="server" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txtPeerReview4" ErrorMessage="Values 0-10" />
					</td>
				</tr>

				<tr>
					<td style="text-align: left;padding: 10px 10px 10px 40px; width: 65%;">
						<asp:Label Style="font-family: sans-serif; color: white; margin-bottom: 10px;" Visible="false" ID="lblUserName5" runat="server" Text="John Doe 5" />
					</td>
					<td style="text-align: right;">
						<asp:TextBox Visible="false" Columns="3" ID="txtPeerReview5" runat="server" style="background: #00000030; width: 35%; height: 30px; color:#FFFFFF; border-radius: 10px; border: none; margin: 0 auto;"/><asp:RangeValidator runat="server" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txtPeerReview5" ErrorMessage="Values 0-10" />
					</td>
				</tr>

				<tr>
					<td style="text-align: left;padding: 10px 10px 10px 40px; width: 65%;">
						<asp:Label Style="font-family: sans-serif; color: white; margin-bottom: 10px;" Visible="false" ID="lblUserName6" runat="server" Text="John Doe 6" />
					</td>
					<td style="text-align: right;">
						<asp:TextBox Visible="false" Columns="3" ID="txtPeerReview6" runat="server" style="background: #00000030; width: 35%; height: 30px; color:#FFFFFF; border-radius: 10px; border: none; margin: 0 auto;"/><asp:RangeValidator runat="server" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txtPeerReview6" ErrorMessage="Values 0-10" />
					</td>
				</tr>

				<tr>
					<td style="text-align: left;padding: 10px 10px 10px 40px; width: 65%;">
						<asp:Label Style="font-family: sans-serif; color: white; margin-bottom: 10px;" Visible="false" ID="lblUserName7" runat="server" Text="John Doe 7" />
					</td>
					<td style="text-align: right;">
						<asp:TextBox Visible="false" Columns="3" ID="txtPeerReview7" runat="server" style="background: #00000030; width: 35%; height: 30px; color:#FFFFFF; border-radius: 10px; border: none; margin: 0 auto;"/><asp:RangeValidator runat="server" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txtPeerReview7" ErrorMessage="Values 0-10" />
					</td>
				</tr>

				<tr>
					<td style="text-align: left;padding: 10px 10px 10px 40px; width: 65%;">
						<asp:Label Style="font-family: sans-serif; color: white; margin-bottom: 10px;" Visible="false" ID="lblUserName8" runat="server" Text="John Doe 8" />
					</td>
					<td style="text-align: right;">
						<asp:TextBox Visible="false" Columns="3" ID="txtPeerReview8" runat="server" style="background: #00000030; width: 35%; height: 30px; color:#FFFFFF; border-radius: 10px; border: none; margin: 0 auto;"/><asp:RangeValidator runat="server" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txtPeerReview8" ErrorMessage="Values 0-10" />
					</td>
				</tr>

				<tr>
					<td style="text-align: left;padding: 10px 10px 10px 40px; width: 65%;">
						<asp:Label Style="font-family: sans-serif; color: white; margin-bottom: 10px;" Visible="false" ID="lblUserName9" runat="server" Text="John Doe 9" />
					</td>
					<td style="text-align: right;">
						<asp:TextBox Visible="false" Columns="3" ID="txtPeerReview9" runat="server" style="background: #00000030; width: 35%; height: 30px; color:#FFFFFF; border-radius: 10px; border: none; margin: 0 auto;"/><asp:RangeValidator runat="server" Type="Integer" MinimumValue="0" MaximumValue="10" ControlToValidate="txtPeerReview9" ErrorMessage="Values 0-10" />
					</td>
				</tr>
			</table>
			</div>
			<div>
			<table style="width: 100%;">
				<tr>
					<td colspan="2" align="center">
						<asp:Label ID="lblError" runat="server" ForeColor="salmon" />
					</td>
				</tr>

				<tr>
					<td colspan="2" align="center">
						<asp:Button CausesValidation="true" Width="300" ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" style="color: white; background: #000000; width: 30%; height: 40px; border-radius: 10px; border: none;" />
					</td>
				</tr>

				<tr>
					<td colspan="2" align="center">
						<asp:Button ID="btnBackToLandingPage" runat="server" Text="Back To Landing Page" OnClick="btnBackToLandingPage_Click" style="color: white; background-color: transparent; width: 70%; height: 40px; border: none;" />
					</td>
				</tr>

			</table>
			</div>
		</div>
    	</div>
	</form>
</body>
</html>