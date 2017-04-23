<?php
    include("DBconn.php");
    include('verify.php');
    $q = mysqli_query($link, "select login, imie, nazwisko from USER where login = '$login_session'");
    $row = mysqli_fetch_row($q);
    if($_SERVER["REQUEST_METHOD"] == "POST")
    {
        $login = mysqli_real_escape_string($link, $_POST['login']);
        $imie = mysqli_real_escape_string($link, $_POST['imie']);
        $nazwisko = mysqli_real_escape_string($link, $_POST['nazwisko']);
        $query = mysqli_query ($link, "UPDATE USER SET login = '$login', imie = '$imie', nazwisko = '$nazwisko' WHERE login='$login_session'");
        if( $query === FALSE ) 
        {
            echo mysqli_error($link);
        }
        else
        {
            header("location: main.php");
        }
    }
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>RCSuser-update</title>
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
            .title
            {
                text-align: center;
                color: #12A5FF;
                font-size: 40px;
            }
        </style>
        <meta name="Author" content="CaeMeS" />       
    </head>
    <body bgcolor="grey" text="black" vlink="#FF9933" link="#FF0033" >
        <div style="color: red">
        <noscript>
            JavaScript is disabled!
        </noscript>
        </div>
    <div id="outer">
        <div id="middle">
            <div id="inner">
            <form name="form" method=post action="" enctype="multipart/form-data">
                <table align="center">
                <h1 class='title'> <b> Update your account </b> </h1>             
                <tr> 
                    <font size="5" face="Bedrock">Login</font> <br>
                 <input type="text" name="login" required maxlength="20" value="<?php echo htmlspecialchars($row[0]); ?>"> <br> <br>
                    <font size="5" face="Bedrock">Name</font> <br>
                 <input type="text" name="imie" required maxlength="20" value="<?php echo htmlspecialchars($row[1]); ?>"> <br> <br>
                    <font size="5" face="Bedrock">Last name</font> <br>
                 <input type="text" name="nazwisko" required maxlength="20" value="<?php echo htmlspecialchars($row[2]); ?>"> <br> <br> <br>
                 <button class="button" type="submit"> <b> Update it! </b>  </button>
                </tr>
                </table>
            </form>
            </div>
        </div>
    </div>
    </body>
</html>