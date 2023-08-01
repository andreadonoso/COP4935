<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Group.aspx.cs" Inherits="Group" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>COP 4935 Group</title>

        <!-- Latest compiled and minified CSS 
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <style>
            html, body {
                margin: 0;
                padding: 0;
                height: 100%;
                display: flex; 
                justify-content: center; 
                align-items: center;
                min-height: 700px;
            }
            body {
                background: linear-gradient(45deg, #2B82C0, #AFD8E5);
            }
        </style>
    </head>
    <body>
        <form id="form1" runat="server">
            <div style="min-height: 600px;">
                <nav class="navbar navbar-dark bg-dark fixed-top" style="height: 60px;">
                    <div class="container-fluid">
                        <div style="display: flex; justify-content: flex-start; align-items: center; text-align: center; height: 100%;">
                            <div style="padding-right: 20px;">
                                <img src="palm-tree.png" alt= "Palm Tree Logo" width="30" height="30">
                            </div>
                            <h6 style="color: #ffffff; margin: 0;">It is another day in paradise</h6>
                        </div>
                        <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
                        <div class="offcanvas-header">
                            <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">Menu</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body">
                            <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                            <li class="nav-item">
                                <asp:LinkButton ID="btnUserInfoMenu" runat="server" Text="User" OnClick="btnUserInfo_Click" Width="100%" style="background-color: rgba(0, 0, 0, 0.0); color: white; height: 40px; border-radius: 10px; border: none; text-align: left; display: flex; justify-content: flex-start; align-items: center; text-decoration: none;">
                                    <div style="padding-left: 10px; padding-right: 10px;">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-user" width="20" height="20" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                            <path d="M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0"></path>
                                            <path d="M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2"></path>
                                        </svg>
                                    </div>
                                    User
                                </asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:LinkButton ID="btnCDRMenu" runat="server" Text="CDR Peer Reviews" OnClick="btnCDR_Click" Width="100%" style="background-color: rgba(0, 0, 0, 0.0); color: white; height: 40px; border-radius: 10px; border: none; text-align: left; display: flex; justify-content: flex-start; align-items: center; text-decoration: none;">
                                    <div style="padding-left: 10px; padding-right: 10px;">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-presentation" width="20" height="20" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                            <path d="M3 4l18 0"></path>
                                            <path d="M4 4v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-10"></path>
                                            <path d="M12 16l0 4"></path>
                                            <path d="M9 20l6 0"></path>
                                            <path d="M8 12l3 -3l2 2l3 -3"></path>
                                        </svg>
                                    </div>
                                    CDR Peer Reviews
                                </asp:LinkButton>
                            </li>
                            <li class="nav-item">
                                <asp:Button ID="btnAdminMenu" runat="server" Text="Admin" Width="100%" OnClick="btnAdmin_Click" style="color: white; background: #0094FF; height: 40px; border-radius: 10px; border: none;"/>
                            </li>
                            <div style="margin-top: 10px; margin-bottom: 10px; background-color: #ffffff; width: 100%; height: 1px; border-radius: 25px;"></div>
                            <li class="nav-item">
                                <asp:Button ID="btnLogOutMenu" runat="server" Text="Log Out" Width="100%" OnClick="btnLogOut_Click" style="color: white; background: #000000; height: 40px; border-radius: 10px; border: none" />
                            </li>
                            </ul>
                        </div>
                        </div>
                    </div>
                </nav>
                <div style="text-align: center; display: flex; flex-direction: column; justify-content: center; align-items: center; padding-top: 60px;">
                <asp:Literal runat="server" ID="litBoxDiv"/>
                        <!-- Menu -->
                        <div class="d-none d-lg-block" style="background-color: rgba(0, 0, 0, 0.19); border-radius: 25px; display: flex; flex-direction: column; justify-content: space-between; align-items: center; left: 0; margin: 0; padding: 0px 10px">
                            <div style="margin-top: 40px">
                                <asp:LinkButton ID="btnUserInfo" runat="server" Text="User" OnClick="btnUserInfo_Click" Width="190px" style="background-color: rgba(0, 0, 0, 0.25); color: white; height: 40px; border-radius: 10px; border: none; text-align: left; display: flex; justify-content: flex-start; align-items: center; text-decoration: none;">
                                    <div style="padding-left: 10px; padding-right: 10px;">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-user" width="20" height="20" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                            <path d="M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0"></path>
                                            <path d="M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2"></path>
                                        </svg>
                                    </div>
                                    User
                                </asp:LinkButton>
                                <div style="width: 190px; height: 3px;"></div>  
                                <asp:LinkButton ID="btnCDR" runat="server" Text="CDR Peer Reviews" OnClick="btnCDR_Click" Width="190px" style="background-color: rgba(0, 0, 0, 0.0); color: white; height: 40px; border-radius: 10px; border: none; text-align: left; display: flex; justify-content: flex-start; align-items: center; text-decoration: none;">
                                    <div style="padding-left: 10px; padding-right: 10px;">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-presentation" width="20" height="20" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                                            <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                            <path d="M3 4l18 0"></path>
                                            <path d="M4 4v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-10"></path>
                                            <path d="M12 16l0 4"></path>
                                            <path d="M9 20l6 0"></path>
                                            <path d="M8 12l3 -3l2 2l3 -3"></path>
                                        </svg>
                                    </div>
                                    CDR Peer Reviews
                                </asp:LinkButton>
                            </div>
                            <div style="margin-bottom: 16px">
                                <asp:Button ID="btnAdmin" runat="server" Text="Admin" Width="190px" OnClick="btnAdmin_Click" style="color: white; background: #0094FF; height: 40px; border-radius: 10px; border: none;"/>
                                <div style="margin-top: 10px; margin-bottom: 10px; background-color: #ffffff; width: 190px; height: 1px; border-radius: 25px;"></div>
                                <asp:Button ID="btnLogOut" runat="server" Text="Log Out" Width="190px" OnClick="btnLogOut_Click" style="color: white; background: #000000; height: 40px; border-radius: 10px; border: none" />
                            </div>
                        </div>
						<div style="margin: 40px; display: flex; flex-direction: column; justify-content: flex-start; align-items: left; text-align: left;">
							<center>
							<table style="width: 100%;">
							<tr>
								<td colspan="2" style="text-align: center;">
									<h1 style="font-family: Arial, Helvetica, sans-serif; color: #FFFFFF; font-size: 35px; width: 75%; font-weight: 900; line-height: 34px; letter-spacing: 0em; margin: 0 auto; padding-bottom: 10px;">Change Group</h1>
								</td>
							</tr>

							<tr>
								<td style="text-align: right;padding: 20px 30px; width: 50%;">
									<label for="txtGroup" style="font-family: sans-serif; color: white; margin-bottom: 10px;padding-right: 10%;">New Group</label>
								</td>
								<td>
									<asp:TextBox ID="txtGroup" runat="server" style="background: #00000030; width: 48%; height: 40px; color:#FFFFFF; border-radius: 10px; border: none; margin: 0 auto;"/>
								</td>
							</tr>

							<tr>
								<td colspan="2" align="center" style="padding: 20px;">
									<asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" style="color: white; background: #000000; width: 30%; height: 40px; border-radius: 10px; border: none" />
								</td>
							</tr>

							<tr>
								<td colspan="2" align="center">
									<asp:Label ID="lblError" runat="server" ForeColor="salmon" />
								</td>
							</tr>

							<tr>
								<td colspan="2" align="center" style="padding: 20px;">
									<asp:Button ID="btnBackToLandingPage" runat="server" Text="Back To Landing Page" OnClick="btnBackToLandingPage_Click" style="color: white; background: #000000; width: 30%; height: 40px; border-radius: 10px; border: none" />
								</td>
							</tr>
							</table>
						</center>
					</div>
				</div>
    		</div>
    	</form>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	</body>
</html>