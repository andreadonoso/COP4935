<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="ResetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="background: linear-gradient(243.15deg, #AFD8E5 0.39%, #2B82C0 99.15%); position: absolute; top: 0; left: 0; width: 100%; height: 100vh; display: flex; justify-content: center; align-items: center;">
            <div style="background: linear-gradient(243.15deg, #AFD8E5 0.39%, #2B82C0 99.15%); position: absolute; top: 0; left: 0; width: 100%; height: 100vh; display: flex; justify-content: center; align-items: center;">
                <div style = "position: absolute; top: 10px; left: 10px;">
                  <img src="palm-tree.png" alt= "Palm Tree Logo" width="50" height="50">
        </div>
        <div style="background: rgba(0,0,0,0.19); width: 75%; max-width: 558px; height: 400px; margin: auto; border-radius: 20px;">
            <center>
                <br /><br />
                <asp:Panel ID="pnlTable" runat="server" Visible="false">
                    <table>
                        <tr>
                            <td colspan="3" style="text-align: center;">
                              <h1 style="color: #FFFFFF; font-size: 35px; width: 75%; font-weight: 900; line-height: 34px; letter-spacing: 0em; margin: 0 auto; padding-bottom: 10px; font-family: Arial, Helvetica, sans-serif;">Reset Password</h1>
                            </td>
                          </tr>
                        <tr>
                            <td colspan="3" align="center" style="font-family: sans-serif; color: #FFFFFF; font-size: 14px; width : 75%; line-height: 20px; letter-spacing: 0em; margin: 0 auto; padding-bottom: 10px;">Enter Your New Password and Confirm</td>
                        </tr>
                        <tr>
                            <td align="right" style="font-family: sans-serif; color: white;">Password<label style="color: red">*</label>: </td>
                            
                            <td> &nbsp;</td>
                            <td><input type="password" id="txtPassword" style="background: #00000030; width: 75%; height: 40px; border-radius: 10px; border: none; margin: 0 auto;" placeholder="nid@ucf.edu"/></td>
                        </tr>  
                        <!-- <tr>
                            <td align="right" style="font-family: sans-serif; color: white;">Password<label style="color: red">*</label>: </td>
                            <td> &nbsp;</td>
                            <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" style="background: #00000030; width: 75%; height: 40px; border-radius: 10px; border: none; margin: 0 auto;" placeholder="nid@ucf.edu" /></td>
                          </tr> -->
                        <tr>
                            <td align="right" style="font-family: Arial, Helvetica, sans-serif; color: white;">Confirm Password <label style="color: red">*</label>:</td>
                            <td> &nbsp;</td>
                            <td><input type="password" id="txtConfirmPassword" style="background: #00000030; width: 75%; height: 40px; border-radius: 10px; border: none; margin: 0 auto;" placeholder="nid@ucf.edu"/></td>
                        </tr>  
                        <!-- <tr>
                            <td align="right" style="font-family: Arial, Helvetica, sans-serif; color: white;">Confirm Password <label style="color: red">*</label>:</td>
                            <td> &nbsp;</td>
                            <td><asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" style="background: #00000030; width: 75%; height: 40px; border-radius: 10px; border: none; margin: 0 auto;" placeholder="nid@ucf.edu" /></td>
                          </tr>                           -->
                        <tr>
                            <td colspan="3">&nbsp;</td>
                        </tr>
                        <tr>
                            <tr>
                                <td colspan="3" align="center" style = " padding: 10px;">
                                  <input type="button" id="btnReset" value="Reset Password" onclick="btnReset_Click()" style="color: white; background: #000000; width: 30%; height: 40px; border-radius: 10px; border: none" />
                                </td>
                              </tr>
                            <tr>
                                <td colspan="3" align="center">
                                  <input type="button" id="btnToLogin" value="Back To Login" onclick="btnToLogin_Click()" style="color: white; border: none; background: none; cursor: pointer; margin: 0;" />
                                </td>
                              </tr>
                        </tr>
                        <!-- <tr>
                            <td colspan="3" align="center" style="padding: 10px;">
                              <asp:Button ID="btnReset" runat="server" Text="Reset Password" OnClick="btnReset_Click" style="color: white; background: #000000; width: 30%; height: 40px; border-radius: 10px; border: none" />
                            </td>
                          </tr>
                          <tr>
                            <td colspan="3" align="center">
                              <asp:Button ID="btnToLogin" runat="server" Text="Back To Login" OnClick="btnToLogin_Click" style="color: white; border: none; background: none; cursor: pointer; margin: 0;" />
                            </td>
                          </tr> -->
                          
                    </table>
                </asp:Panel>

                <br />
                <br />

                <asp:Label id="lblError" runat="server" Font-Size="Larger" Text="" ForeColor="Salmon" />
            </center>
        </div>
	</div>
    </form>
</body>
</html>
