<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>View Scores</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        table {
          border-collapse: collapse;
        }
        table, th, td {
          border: none;
          padding: 5px; 
        }
          
        .scrollable-div {
            background: rgba(0, 0, 0, 0.44);
            overflow: auto;
            max-height: 300px;
            border-radius: 10px;
        }

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
        table {
            border-collapse: collapse;
            width: 100%;
        }

        table, th, td {
            border: none;
            padding: 5px;
        }

        th {
            text-align: center;
            background: rgba(0, 0, 0, 0.19);
            color: white;
            border-radius: 20px;
        }

        td {
            text-align: left;
        }

        .criteria-cell {
            text-align: center;
        }

        .score-cell {
            text-align: center;
        }

        .comment-cell {
            text-align: left;
            padding-top: 10px;
        }
      </style>

</head>

<body>
    <form method="post" action="./Landing.aspx" id="form1">
        <div style="background: linear-gradient(45deg, #2B82C0, #AFD8E5); width: 100%; height: 100%; position: absolute; top: 0; left: 0; text-align: center; display: flex; flex-direction: column; justify-content: center; align-items: center;">
            <div style="background-color: rgba(0, 0, 0, 0.0); position: absolute; width: 100%; height: 60px; top: 0; display: flex; justify-content: flex-start; align-items: center;">
                <div style="padding: 0px 20px;">
                    <img src="palm-tree.png" alt="Palm Tree Logo" width="35" height="35">
                </div>
                <h3 style="color: #ffffff">It is another day in paradise</h3>
            </div>
            <div style="padding-bottom: 30px;">
                <h1 style="color: #ffffff">Welcome</h1>
            </div>

            <div style="display: flex; background-color: rgba(0, 0, 0, 0.19); color: #ffffff; max-width: 1200px; width: 90%; height: 596px; margin: 0 auto; border-radius: 25px;" id="mainBox">
                <!-- <div style="background-color: rgba(0, 0, 0, 0.19); width: 100%; max-width: 235.8px; height: 100%; border-radius: 25px; display: flex; flex-direction: column; display: flex; flex-direction: column; justify-content: space-between; align-items: center;">
                    <div style="margin-top: 40px">
                        <a id="btnUserInfo" href="javascript:__doPostBack(&#39;btnUserInfo&#39;,&#39;&#39;)"
                            style="display:inline-block;width:190px;background-color: rgba(0, 0, 0, 0.25); color: white; height: 40px; border-radius: 10px; border: none; text-align: left; display: flex; justify-content: flex-start; align-items: center; text-decoration: none;">
                            <div style="padding-left: 10px; padding-right: 10px; padding-top: 4px;">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-user"
                                    width="20" height="20" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
                                    fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <path d="M8 7a4 4 0 1 0 8 0a4 4 0 0 0 -8 0"></path>
                                    <path d="M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2"></path>
                                </svg>
                            </div>
                            User
                        </a>
                        <div style="width: 100%; height: 3px;"></div>
                        <a id="btnCDR" href="javascript:__doPostBack(&#39;btnCDR&#39;,&#39;&#39;)"
                            style="display:inline-block;width:100%;max-width:190px;background-color: rgba(0, 0, 0, 0.0); color: white; height: 40px; border-radius: 10px; border: none; text-align: left; display: flex; justify-content: flex-start; align-items: center; text-decoration: none;">
                            <div style="padding-left: 10px; padding-right: 10px; padding-top: 4px;">
                                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-presentation"
                                    width="20" height="20" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor"
                                    fill="none" stroke-linecap="round" stroke-linejoin="round">
                                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                    <path d="M3 4l18 0"></path>
                                    <path d="M4 4v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-10"></path>
                                    <path d="M12 16l0 4"></path>
                                    <path d="M9 20l6 0"></path>
                                    <path d="M8 12l3 -3l2 2l3 -3"></path>
                                </svg>
                            </div>
                            CDR Peer Reviews
                        </a>
                    </div>
                    <div style="margin-bottom: 16px">
                        <input type="submit" name="btnAdmin" value="Admin" id="btnAdmin"
                            style="width:100%;max-width: 190px;color: white; background: #0094FF; height: 40px; border-radius: 10px; border: none;" />
                        <div style="margin-top: 10px; margin-bottom: 10px; background-color: #ffffff; width: 190px; height: 1px; border-radius: 25px;"></div>
                        <input type="submit" name="btnLogOut" value="Log Out" id="btnLogOut"
                            style="width:100%;max-width:190px;color: white; background: #000000; height: 40px; border-radius: 10px; border: none" />
                    </div>
                </div> -->

                <div style="width: 100%; padding: 20px;">
                    <center>
                        <h1>Class Score:</h1>
                        <!-- <div class = "scrollable-div">
                        <asp:Literal runat="server" ID="litPeerReview" /><br />
                        </div> -->
                        <!-- PREVIEW! PLEASE ERASE AFTER IMPLEMENTATION -->
                        <!-- Try and insert header code into APSX.CS code and modify layout accordingly to preview-->
                        <div class = "scrollable-div">
                            <table border="1">
                                <tr>
                                    <th>Criteria</th>
                                    <th>Scores</th>
                                </tr>
                                <tr>
                                    <td class="criteria-cell">Technical Difficulty... &nbsp;</td>
                                    <td class="score-cell">7</td>
                                </tr>
                                <tr>
                                    <td class="criteria-cell">Problem Understanding... &nbsp;</td>
                                    <td class="score-cell">7</td>
                                </tr>
                                <tr>
                                    <td class="criteria-cell">Quality of Problem Solv... &nbsp;</td>
                                    <td class="score-cell">7</td>
                                </tr>
                                <tr>
                                    <td class="criteria-cell">Design and Implement... &nbsp;</td>
                                    <td class="score-cell">7</td>
                                </tr>
                                <tr>
                                    <td class="criteria-cell">Apparent Distribution... &nbsp;</td>
                                    <td class="score-cell">8</td>
                                </tr>
                                <tr>
                                    <td class="criteria-cell">Project Definition and... &nbsp;</td>
                                    <td class="score-cell">7</td>
                                </tr>
                                <tr>
                                    <td class="criteria-cell">Presentation of Problem... &nbsp;</td>
                                    <td class="score-cell">7</td>
                                </tr>
                                <tr>
                                    <td class="criteria-cell">Presentation of Technical... &nbsp;</td>
                                    <td class="score-cell">7</td>
                                </tr>
                                <tr>
                                    <td class="criteria-cell">Presentation of Admin... &nbsp;</td>
                                    <td class="score-cell">7</td>
                                </tr>
                                <tr>
                                    <td class="criteria-cell">Overall Presentation Format... &nbsp;</td>
                                    <td class="score-cell">7</td>
                                </tr>
                                <tr>
                                    <td class="criteria-cell">Total&nbsp;</td>
                                    <td class="score-cell">71</td>
                                </tr>
                                <table>
                                <tr><th>Comments</th></tr>
                                <tr><td class="comment-cell">* Group 7 (our group) was second. Filling out personal review through site now for all group members.</td></tr>
                                <tr><td class="comment-cell">* Group 7 (our group) was second. Filling out personal review through site now for all group members.</td></tr>
                                
                            </table>
                            </table>
                        </div>
                    </center>
                    <center>
                        <button type="button" id="btnBackToAdmin"
                            style="width:100%;max-width:190px;color: white; background: #000000; height: 40px; border-radius: 10px; border: none; margin-top: 30px;">Exit</button><br />
                        <span id="lblError" style="color: salmon;"></span>
                    </center>
                </div>

            </div>
        </div>
    </form>
</body>

</html>
