<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Forgot.aspx.cs" Inherits="Forgot" %>

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
    <title>Forgot Password</title>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <script>
    function sendDataToServer() {
      var errorMessage = document.getElementById("lblError").textContent;
      var xhr = new XMLHttpRequest();
      xhr.open("POST", "Forgot.aspx?errorMessage=" + encodeURIComponent(errorMessage), true);
      xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
          console.log("Data sent to the server.");
          window.location.href = "Default.aspx";
        }
      };
      xhr.send();
    }
  </script>
  
</head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<body>
    <form id="form1" runat="server">
      
      <div style="background: linear-gradient(243.15deg, #AFD8E5 0.39%, #2B82C0 99.15%); position: absolute; top: 0; left: 0; width: 100%; height: 100vh; display: flex; justify-content: center; align-items: center;">
      <div style = "position: absolute; top: 10px; left: 10px;">
        <img src="palm-tree.png" alt= "Palm Tree Logo" width="50" height="50">
      </div>
 
 
      <div style="background: rgba(0,0,0,0.19); width: 75%; max-width: 558px; height: 487px; margin: auto; border-radius: 20px;">
        <br /><br /><br />
        <center>
          <table style="width: 100%;">
            <tr>
              <td colspan="2" style="text-align: center;">
                <h1 style="font-family: Arial, Helvetica, sans-serif; color: #FFFFFF; font-size: 35px; width: 75%; font-weight: 900; line-height: 34px; letter-spacing: 0em; margin: 0 auto; padding-bottom: 10px;">Forgot Password</h1>
              </td>
            </tr>
            <tr>
              <td colspan="2" style="text-align: center;">
                <h2 style="font-family: Arial, Helvetica, sans-serif; color: #FFFFFF; font-size: 14px; width : 75%; line-height: 20px; letter-spacing: 0em; margin: 0 auto; padding-bottom: 10px;">Enter your account's email address and we'll send you a link to reset your password</h2>
              </td>
            </tr>
            <tr>
              <td colspan="2" align="center" style = "padding: 20px 30px;">
                <label for="txtEmail" style="font-family: sans-serif; color: white; margin-bottom: 10px;padding-right: 55%;">Email<label style="color: red">*</label></label><br>
                <input type="text" id="txtEmail" style="background: #00000030; width: 75%; height: 40px; border-radius: 10px; border: none; margin: 0 auto;" placeholder="nid@ucf.edu" />
              </td>
            </tr>
            <!-- <tr>
              <td colspan="2" align="center" style="padding: 20px 30px;">
                <label for="txtEmail" style="color: white; margin-bottom: 10px;padding-right: 55%;">Email<label style="color: red">*</label></label><br>
                <asp:TextBox ID="txtEmail" runat="server" style="background: #00000030; width: 75%; height: 40px; border-radius: 10px; border: none; margin: 0 auto;" placeholder="nid@ucf.edu" />
              </td>
            </tr> -->
            <tr>
              <td colspan="2" align="center" style="padding: 20px;">
                <input type="button" id="btnRecover" value="Recover" onclick="sendDataToServer();" style="color: white; background: #000000; width: 30%; height: 40px; border-radius: 10px; border: none" />
              </td>
            </tr>
            <!-- <tr>
              <td colspan="2" align="center" style="padding: 20px;">
                <asp:Button ID="btnRecover" runat="server" Text="Recover" OnClick="sendDataToServer();" style="color: white; background: #000000; width: 30%; height: 40px; border-radius: 10px; border: none" />
              </td>
            </tr> -->            
            <tr>
              <td colspan="2" align="center">
                <input type="button" id="btnBack" value="Back To Login" onclick="btnBack_Click()" style="color: white; border: none; background: none; cursor: pointer; margin: 0;" />
              </td>
            </tr>
            <!-- <tr>
              <td colspan="2" align="center">
                <asp:Button ID="btnBack" runat="server" Text="Back To Login" OnClick="btnBack_Click" style="color: white; border: none; background: none; cursor: pointer; margin: 0;" />
              </td>
            </tr>             -->
            <tr>
              <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="2" align="center">
                <label id="lblError" style="color: salmon;"></label>
              </td>
            </tr> 
            <!-- <tr>
              <td colspan="2" align="center">
                <asp:Label ID="lblError" runat="server" style="color: salmon;"></asp:Label>
              </td>
            </tr>  -->
          </table>
        </center>
        <br /><br />
      </div>
      
      
      
    </div>
    </form>
</body>
</html>


