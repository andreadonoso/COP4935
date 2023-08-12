<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PeerReviewForm.aspx.cs" Inherits="PeerReviewForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<link href="PeerReviewForm.css" rel="stylesheet">
	<script type="text/javascript" src="PeerReviewForm.js"></script>
    <title>COP 4935 Peer Review Form</title>
</head>
<body>
	<div class="Header">
		<div class="HeaderBlock">UCF</div>
		<div class="HeaderBlockCenter">Department of CS</div>
		<div class="HeaderBlockRight">Page 1/1</div>
	</div>
	<div class="TitleBlock">COP 4935 - CS Senior Design II - Critical Design Review Peer Evaluation Form</div>
	<div class="SemesterAndDateBlock">Semester: <span id="SemesterNumber">Spring 2023</span><div class="Spacer"></div> Date: <span id="TodaysDate">9/6/2020</span></div>
	<div class="Bordered">
		<div class="PresentationGroupNumbers">
			<div class="PresentationText">First Presentation Group Number:&nbsp;</div><div class="PresentationInput"><input id="FirstGroupNumber" /></div>
			<div class="Spacer"></div>
			<div class="PresentationText">Second Presentation Group Number:&nbsp;</div><div class="PresentationInput"><input id="SecondGroupNumber" /></div>
		</div>
		<div class="PresentationGroupNumbers">
			<div class="PresentationText">Third Presentation Group Number:&nbsp;</div><div class="PresentationInput"><input id="ThirdGroupNumber" /></div>
			<div class="Spacer"></div>
			<div class="PresentationText">Fourth Presentation Group Number:&nbsp;</div><div class="PresentationInput"><input id="FourthGroupNumber" /></div>
		</div>
	</div>
	<div class="InstructionsBlock"><span class="Underlined">Project Evaluation:</span> Please rank the project using the points range shown for the following categories. Do nor rate your own group.</div>
	<div class="RatingsBlock">
		<center>
			<table style="padding: 10px;">
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td align="center">1<sup>st</sup></td>
					<td align="center">2<sup>nd</sup></td>
					<td align="center">3<sup>rd</sup></td>
					<td align="center">4<sup>th</sup></td>
				</tr>
				<tr>
					<td>1)</td>
					<td>Tecnical difficulty of the project (0-10):</td>
					<td><input id="1-1" class="RatingInput" onchange="totalColumn(1);"/></td>
					<td><input id="1-2" class="RatingInput" onchange="totalColumn(2);" /></td>
					<td><input id="1-3" class="RatingInput" onchange="totalColumn(3);" /></td>
					<td><input id="1-4" class="RatingInput" onchange="totalColumn(4);" /></td>
				</tr>
				<tr>
					<td>2)</td>
					<td>Problem understanding by the group (0-10):</td>
					<td><input id="2-1" class="RatingInput" onchange="totalColumn(1);" /></td>
					<td><input id="2-2" class="RatingInput" onchange="totalColumn(2);" /></td>
					<td><input id="2-3" class="RatingInput" onchange="totalColumn(3);" /></td>
					<td><input id="2-4" class="RatingInput" onchange="totalColumn(4);" /></td>
				</tr>
				<tr>
					<td>3)</td>
					<td>Quality of problem solving methods (0-10):</td>
					<td><input id="3-1" class="RatingInput" onchange="totalColumn(1);" /></td>
					<td><input id="3-2" class="RatingInput" onchange="totalColumn(2);" /></td>
					<td><input id="3-3" class="RatingInput" onchange="totalColumn(3);" /></td>
					<td><input id="3-4" class="RatingInput" onchange="totalColumn(4);" /></td>
				</tr>
				<tr>
					<td>4)</td>
					<td>Design and implementation efficiency (0-10):</td>
					<td><input id="4-1" class="RatingInput" onchange="totalColumn(1);" /></td>
					<td><input id="4-2" class="RatingInput" onchange="totalColumn(2);" /></td>
					<td><input id="4-3" class="RatingInput" onchange="totalColumn(3);" /></td>
					<td><input id="4-4" class="RatingInput" onchange="totalColumn(4);" /></td>
				</tr>
				<tr>
					<td>5)</td>
					<td>Apparent distribution of work within the group (0-10):</td>
					<td><input id="5-1" class="RatingInput" onchange="totalColumn(1);" /></td>
					<td><input id="5-2" class="RatingInput" onchange="totalColumn(2);" /></td>
					<td><input id="5-3" class="RatingInput" onchange="totalColumn(3);" /></td>
					<td><input id="5-4" class="RatingInput" onchange="totalColumn(4);" /></td>
				</tr>
			</table>
		</center>
	</div>
	<div class="InstructionsBlock"><span class="Underlined">Presentation Evaluation:</span> Please rank the presentation using the points range shown for the following categories.</div>
	<div class="RatingsBlock">
		<center>
			<table style="padding: 10px;">
				<tr>
					<td>6)</td>
					<td>Project definition and specification presentation (0-10):</td>
					<td><input id="6-1" class="RatingInput" onchange="totalColumn(1);" /></td>
					<td><input id="6-2" class="RatingInput" onchange="totalColumn(2);" /></td>
					<td><input id="6-3" class="RatingInput" onchange="totalColumn(3);" /></td>
					<td><input id="6-4" class="RatingInput" onchange="totalColumn(4);" /></td>
				</tr>
				<tr>
					<td>7)</td>
					<td>Presentation of problem understanding (0-10):</td>
					<td><input id="7-1" class="RatingInput" onchange="totalColumn(1);" /></td>
					<td><input id="7-2" class="RatingInput" onchange="totalColumn(2);" /></td>
					<td><input id="7-3" class="RatingInput" onchange="totalColumn(3);" /></td>
					<td><input id="7-4" class="RatingInput" onchange="totalColumn(4);" /></td>
				</tr>
				<tr>
					<td>8)</td>
					<td>Presentation of technical design by each member (0-10):</td>
					<td><input id="8-1" class="RatingInput" onchange="totalColumn(1);" /></td>
					<td><input id="8-2" class="RatingInput" onchange="totalColumn(2);" /></td>
					<td><input id="8-3" class="RatingInput" onchange="totalColumn(3);" /></td>
					<td><input id="8-4" class="RatingInput" onchange="totalColumn(4);" /></td>
				</tr>
				<tr>
					<td>9)</td>
					<td>Presentation of administrative content (0-10):</td>
					<td><input id="9-1" class="RatingInput" onchange="totalColumn(1);" /></td>
					<td><input id="9-2" class="RatingInput" onchange="totalColumn(2);" /></td>
					<td><input id="9-3" class="RatingInput" onchange="totalColumn(3);" /></td>
					<td><input id="9-4" class="RatingInput" onchange="totalColumn(4);" /></td>
				</tr>
				<tr>
					<td>10)</td>
					<td>Overall presentation format and effectiveness (0-10):</td>
					<td><input id="10-1" class="RatingInput" onchange="totalColumn(1);" /></td>
					<td><input id="10-2" class="RatingInput" onchange="totalColumn(2);" /></td>
					<td><input id="10-3" class="RatingInput" onchange="totalColumn(3);" /></td>
					<td><input id="10-4" class="RatingInput" onchange="totalColumn(4);" /></td>
				</tr>
				<tr>
					<td colspan="6">&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td align="right">Total:</td>
					<td><input id="1-total" class="RatingInput" readonly /></td>
					<td><input id="2-total" class="RatingInput" readonly /></td>
					<td><input id="3-total" class="RatingInput" readonly /></td>
					<td><input id="4-total" class="RatingInput" readonly /></td>
				</tr>
			</table>
		</center>
	</div>

	<div class="RatingsBlock">
		<br /><br />
		Remarks (if any, and please specify group number):<br />
		<textarea name="Remarks" id="Remarks" cols="40" rows="5"></textarea>		
	</div>

	<div class="NIDBlock">
		<br /><br />
		Reviewer's Student NID: <span id="NIDNumber"></span>
	</div>

	<div class="SubmitButtonBlock">
		<asp:Literal runat="server" ID="litSubmitButton" />
		
	</div>
		
	

	<div class="SubmitButtonBlock">
		<span id="errorMessage" class="ErrorMessage"></span>
	</div>

    <form id="form1" runat="server">
    <div class = "SubmitButtonBlock">
		<asp:Button ID="btnBackToCDR" runat="server" Text="Exit" style = "font-size:13.3333px; font-family: Arial; width:150px; height:40px;" OnClick="btnBackToCDR_Click" />
    </div>
	<asp:Literal runat="server" ID="litScript" />
    </form>

</body>
</html>
