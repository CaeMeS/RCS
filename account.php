<?php
    include("DBconn.php");
    include('verify.php');
    $query = mysqli_query($link, "SELECT imie, nazwisko, gender, data_utworzenia FROM USER WHERE login = '$login_session'");
    $row = mysqli_fetch_row($query);
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>RCSaccount</title>
        <style type="text/css">             
            #outer {display: table; position: absolute; height: 100%; width: 100%;}
            #middle {display: table-cell; vertical-align: middle;}
            #inner {margin-left: auto; margin-right: auto; width: 800px;} 
            .button
            {
                background-color: #FF9933;
                font-size: 10px;
                padding: 10px 24px;               
            }
        </style>
        <meta name="Author" content="CaeMeS" />       
    </head>
    <body bgcolor="grey" text="#12A5FF" vlink="#FF9933" link="#FF0033" >
        <div style="color: red">
        <noscript>
            JavaScript is disabled!
        </noscript>
        </div>
        <form name="form" method='post' action="">
    <div id="outer">
        <div id="middle">
            <div id="inner">       
                <table align="center"> 
                    <h1 align="center"> <font size="7" face="Arial Black" color="#fb9437"><?php echo $login_session; ?></font> </h1>
                    <td>
                        <font size="4" color="black" face="Bedrock">Name: </font>
                        <font size="5" face="Bedrock"><?php echo htmlspecialchars($row[0]); ?> </font> <br>
                        <font size="4" color="black" face="Bedrock">Last name: </font>
                        <font size="5" face="Bedrock"><?php echo htmlspecialchars($row[1]); ?> </font> <br>
                        <font size="4" color="black" face="Bedrock">Gender: </font>
                        <font size="5" face="Bedrock"><?php echo $row[2]; ?> </font> <br>
                        <font size="4" color="black" face="Bedrock">Created: </font>
                        <font size="5" face="Bedrock"><?php echo $row[3]; ?> </font> <br> <br> <br>
                        <button class="button" onclick="location.href='http://localhost/RCS/deleteaccount.php'" type="button" name="delete"> DELETE </button> 
                        <button class="button" onclick="location.href='http://localhost/RCS/updateaccount.php'" type="button" name="update"> UPDATE </button>
                        <button class="button" onclick="location.href='http://localhost/RCS/main.php'" type="button" name="back"> GO BACK </button> <br> <br>
                    </td>                  
                </table>
            </div>
        </div>  
    </div>
    </form>
    </body>
</html>