<?php
    include("DBconn.php");
    include('verifyadmin.php');
    $id = $_GET['id'];
    if($_SERVER["REQUEST_METHOD"] == "POST")
    {      
        $delete = mysqli_real_escape_string($link , $_POST['deletecomment']);
        $q=mysqli_query($link, "update USER set deletecomment = '$delete' where id_user='$id'"); 
        header("location: users.php");
    } 
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>RCSlogin</title>
        <style>
             #outer {display: table; position: absolute; height: 100%; width: 100%;}
             #middle {display: table-cell; vertical-align: middle;}
             #inner {margin-left: auto; margin-right: auto; width: 650px;}
            .button
            {
                background-color: #FF9933;
                font-size: 10px;
                padding: 10px 24px;               
            }
            table
            {
               font-size: 25px; 
            }
            td
            {
                color: black;
            }
            </style>
        <meta name="Author" content="CaeMeS" />
    </head>
    <body bgcolor="grey" text="#12A5FF" vlink="#FF9933" link="#FF9933"> 
        <div style="color: red">
        <noscript>
            JavaScript is disabled!
        </noscript>
        </div>
        <div id="outer">
        <div id="middle">
            <div id="inner">
            <form name="form" method=post action="">
                <h1> Delete with comment </h1>
                <textarea style="color: black; background-color: grey; font-size: 12pt; font-weight: bold; resize:none; border:groove 4px black " name="deletecomment" cols = "50" maxlength="100"></textarea> <br> <br>
                <input class="button" type="submit" value="DELETE">
                <button class="button" onclick="location.href='http://localhost/RCS/deleteit.php?id=<?php echo $id; ?>'" type="button" name="fdelete"> FAST DELETE </button> 
                <button class="button" onclick="goBack()">GO BACK</button>
            </form>
            </div>
        </div>
        </div>
    </body>
    <script>
    function goBack() 
    {
            window.history.back();
    }
    </script>
</html>