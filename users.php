<?php
    include("DBconn.php");
    include('verifyadmin.php');
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
            <form method=post action="">
                <table align="center" border="1" cellpadding="5" cellspacing="5">
                    <tr>
                    <th> LOGIN </th>
                    <th> NAME </th>
                    <th> LASTNAME </th>
                    <th> CREATED </th>
                    <th> DELETE </th>
                    </tr>
                    <?php 
                    $query = mysqli_query($link, "select id_user, login, imie, nazwisko, data_utworzenia from USER where login <> 'admin'");
                    while($row = mysqli_fetch_array($query))
                    {
                        echo "<tr>";
                        echo "<td>".$row['login']."</td>";
                        echo "<td>".$row['imie']."</td>";
                        echo "<td>".$row['nazwisko']."</td>";
                        echo "<td>".$row['data_utworzenia']."</td>";
                        echo "<td> <a href = 'deleteform.php?id=".$row['id_user']."' style='text-decoration: none'> DELETE </a> </td>";
                        echo "</tr>";
                    }
                    ?>
                </table> <br> <br>
                <button class="button" onclick="location.href='http://localhost/RCS/main.php'" type="button" name="main"> HOME </button> 
            </form>
            </div>
        </div>
        </div>
    </body>
</html>