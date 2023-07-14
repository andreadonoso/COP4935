<%@ Page Language="C#" AutoEventWireup="true" CodeFile="COP4935PeerReview.aspx.cs" Inherits="COP4935PeerReview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>COP 4935 Peer Review</title>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">

	<center>
	<table>
		<tr>
			<td align="center" style="background-color: lightgray; padding: 10px;">
				UCF Department of CS<br />
				COP 4935 – CS Senior Design II – Critical Design Review Peer Evaluation Form
				<br />
			</td>
		</tr>
		<tr>
			<td align="center">
				Semester: Fall 2020, Date: <asp:Label runat="server" ID="lblDate" Text="test" />
			</td>
		</tr>



		<tr>
			<td align=center>
				<asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" />
				&nbsp;&nbsp;
				<asp:Button runat="server" ID="btnCancel" Text="Cancel" OnClick="btnCancel_Click" />
			</td>
		</tr>
	</table>
	</center>
    </form>
</body>
</html>
