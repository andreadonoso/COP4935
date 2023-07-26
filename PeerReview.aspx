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
    <link rel="stylesheet" href="PeerReview.css">


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
    <form id="form1" runat="server">
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

                <div style="width: 100%; padding: 20px;">
                    <center>
                        <h1>Class Score:</h1>
                        <div class = "scrollable-div">
                        <asp:Literal runat="server" ID="litPeerReview" /><br />
                        </div>
                        <!-- PREVIEW! PLEASE ERASE AFTER IMPLEMENTATION -->
                        <!-- Try and insert header code into APSX.CS code and modify layout accordingly to preview-->

                    </center>
                    <center>  
                        <asp:Button runat="server" ID="btnBackToAdmin" Text="Exit" OnClick="btnBackToAdmin_Click" style="width:100%;max-width:190px;color: white; background: #000000; height: 40px; border-radius: 10px; border: none; margin-top: 30px;" /><br />
		                <asp:Label runat="server" ID="lblError" Text="" ForeColor="salmon" />
                    </center>
                </div>

            </div>
        </div>
    </form>
</body>

</html>
