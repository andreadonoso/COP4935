
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<style>
    input::placeholder {
    opacity: 0.5;
    color: white;
    padding-left: 15px;
}
    </style>
    <title>COP 4935 Forgot Password</title>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
    <form id="form1" runat="server">
      
    <div style="background: linear-gradient(243.15deg, #AFD8E5 0.39%, #2B82C0 99.15%); width: 100%; height: 100%; position: absolute; top: 0; left: 0; text-align: center; padding: 100px">
      <div style = "position: absolute; top: 10px; left: 10px;">
        <img src="palm-tree.png" alt= "Palm Tree Logo" width="50" height="50">
      </div>
		<div style="background: rgba(0,0,0,0.19); width: 558px; height: 487px; top: 269px; left: 441px; margin: auto; border-radius: 20px;">
			<br /><br /><br />
			<center>
                <table>
                <tr><h1 style="color: #FFFFFF; width: 558px; height: 54px; top: 371px; left: 441px; font-size: 48px; font-weight: 900; line-height: 54px; letter-spacing: 0em; text-align: center;">Forgot Password</h1></tr>
                <tr><h1 style="color: #FFFFFF; width: 286px; height: 39px; top: 371px; left: 441px; font-size: 12px; line-height: 20px; letter-spacing: 0em; text-align: center;">Enter your account's email address and we'll send you a link to reset your password</h1></tr>
  <tr>
  <label for="txtEmail" style = "color: white; float: left; padding-left: 94px; padding-top: 10px ">Email<label style = "color: red">*</label></label><br>
  <td><input type="text" runat="server" id="txtEmail" style="background: #00000030; width: 422px; height: 64px; top: 499px; left: 510px; border-radius: 10px; border: none" placeholder = "nid@ucf.edu" /></td>
</tr>
<tr>
  <td colspan="2" align="center" style = "padding: 30px">
    <input type="button" id="btnRecover" value="Recover" onclick="btnRecover_Click()" style = "color: white; background: #000000; width: 164px; height: 46px; top: 616px; left: 639px; border-radius: 10px; border: none"/>
  </td>
</tr>
<tr>
  <td colspan="2" align="center">
    <input type="button" id="btnBack" value="Back To Login" onclick="btnBack_Click()" style = "color: white; border: none; background: none; cursor: pointer; margin: 0;"
 />
  </td>
</tr>
<tr>
  <td colspan="2">&nbsp;</td>
</tr>
<tr>
  <td colspan="2" align="center">
    <label id="lblError" style="color: salmon;"></label>
  </td>
</tr>  
                </table>
			</center>
			<br /><br />
		</div>
    </div>
    </form>
</body>
</html>


