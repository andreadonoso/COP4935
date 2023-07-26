<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SelectPeerReviewDate.aspx.cs" Inherits="SelectPeerReviewDate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>COP 4935 Select Peer Review Date</title>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
		::-webkit-scrollbar {
        width: 8px;
        }

        ::-webkit-scrollbar-track {
        box-shadow: inset 0 0 5px black; 
        border-radius: 10px;
        }
        
        ::-webkit-scrollbar-thumb {
        background: black; 
        border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb:hover {
        background: grey; 

        }
	</style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background: linear-gradient(243.15deg, #AFD8E5 0.39%, #2B82C0 99.15%); position: absolute; top: 0; left: 0; width: 100%; height: 100vh; display: flex; justify-content: center; align-items: center;">
		<!-- <div style="background-color: #ffffee; width:500px; height: 200px; margin: auto; border-radius: 25px;">
			<br />
			<center>
				<asp:ListBox ID="lstPeerDates" width="300" runat="server" AutoPostBack="true" OnSelectedIndexChanged="lstPeerDates_SelectedIndexChanged"></asp:ListBox>
				<br /><asp:Label ID="lblError" runat="server" ForeColor="salmon" />
			</center>
			<br />
			<asp:Button ID="btnBackToLandingPage" runat="server" Text="Cancel" OnClick="btnBackToLandingPage_Click" />
		</div> -->
		<!DOCTYPE html>
<html>
<head>
    <title>Peer Dates List</title>
</head>
<body>
    <div align = "center" style="background: rgba(0,0,0,0.19); width: 100%; max-width: 700px; height: 70%; max-height: 800px; margin: auto; border-radius: 20px;">
		<div style = "position: absolute; top: 10px; left: 10px;">
			<img src="palm-tree.png" alt= "Palm Tree Logo" width="50" height="50">
		  </div>
		<h1 style = "color: white; padding-top: 25px;">Class Peer Review</h1>
        <br />
        <center>
            <select size = 10 id="lstPeerDates" style=" color : white; background: rgba(0, 0, 0, 0.25)  ; width: 80%; border-color: white; border-radius: 5px; height: 60%; max-height: 80%; font-size: large;" onchange="lstPeerDates_SelectedIndexChanged()">
				<optgroup align = "center" label="Select Date" style="padding: 20px"></optgroup>
				<optgroup align = "center" style="background-color: #ffffff; width: 90%; height: 1px; border-radius: 25px; margin-left: 20px; margin-bottom: 20px;"></optgroup>
				<option value="50">5/23/2023</option>
				<option value="51">5/25/2023</option>
				<option value="52">5/30/2023</option>
				<option value="53">6/1/2023</option>
				<option value="54">6/6/2023</option>
				<option value="55">2/2/2023</option>
			</select>
            <br />
            <label id="lblError" style="color: salmon;"></label>
        </center>
        <br />
        <button id="btnBackToLandingPage" onclick="btnBackToLandingPage_Click()"style="width:100%;max-width:190px;color: white; background: #000000; height: 40px; border-radius: 10px; border: none;@media screen and (max-width: 480px) {
            font-size: 14px; /* Adjust font size for mobile view */}">Exit</button>
    </div>
</body>
</html>

    </div>
    </form>
</body>
</html>
