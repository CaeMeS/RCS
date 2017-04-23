<?php
    include("DBconn.php");
    include('verify.php');
    $date = date('Y-m-d');
    echo $date;
    $query = mysqli_query($link, "select * from USER");
    $users = mysqli_num_rows($query);
    $query1 = mysqli_query($link, "select * from AUTO");
    $cars = mysqli_num_rows($query1);
    $query2 = mysqli_query($link, "select * from TEKST");
    $texts = mysqli_num_rows($query2);

    $queryu = mysqli_query($link, "select id_user from USER where login = '$login_session'");
    $row = mysqli_fetch_row($queryu);    

    $query3 = mysqli_query($link, "select * from AUTO where id_user = '$row[0]'");
    $cars2 = mysqli_num_rows($query3);
    $query4 = mysqli_query($link, "select * from TEKST where id_tworcy = '$row[0]'");
    $texts2 = mysqli_num_rows($query4);
    $query5 = mysqli_query($link, "select * from OPINIA where nazwa = '$login_session'");
    $comm = mysqli_num_rows($query5);
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>RCSmain</title>
        <meta name="Author" content="CaeMeS" />
        <style>
.button {
  display: inline-block;
  border-radius: 4px;
  background-color: #FF9933;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 28px;
  padding: 20px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
             .lol {
	font-family: Copperplate, "Copperplate Gothic Light", fantasy;
	font-size: 42px;
	font-style: italic;
	font-variant: small-caps;
	font-weight: bold;
	line-height: 44px;
    color: black;
}
</style>
    </head>
    <body bgcolor="grey" text="black" vlink="#FF9933" link="#FF0033">
        <div style="color: red">
        <noscript>
            JavaScript is disabled!
        </noscript>
        </div>
        <div>
        <div style="position: absolute; top: 40; left: 70; width: 600px; text-align:left;">
            <h1 style="color: #12A5FF">You are logged as <a style="text-decoration: none; color: #FF0033;" href = "account.php"><?php echo htmlspecialchars($login_session); ?></a> </h1>  
        </div> 
            <div style="position: absolute; top: 80; left: 750; width: 1200px; text-align:left;"> 
                <table>
                    <tr> 
                        <td> <img src="RCS.png" style="width:150px;height:150px;"> </td> 
                        <td> <h1 class="lol"> Random Car Site </h1> </td>
                    </tr>
                </table>
        </div> 
        <div style="position: absolute; top: 300; left: 450; width: 600px; text-align:left;">
            <p style="font-size: 30px; color: black;"> <b>Welcome on our site! </b> <br> You can view cars and car related articles <br> Feel free to add them by yourself! <br> We apreciate any form of contribution to this site  </p>
        </div>
        <div style="position: absolute; top: 500; left: 900; width: 600px; text-align:right;">
            <p style="font-size: 30px; color: black;"> <b>  Currently in our database</b> <br> Registered users - <?php echo $users - 1; ?><br> Cars - <?php echo $cars; ?><br> Articles - <?php echo $texts; ?></p>
        </div>
        <div style="position: absolute; top: 500; left: 450; width: 600px; text-align:left;">
            <p style="font-size: 30px; color: black;"> <b>  User stats</b> <br> Cars - <?php echo $cars2; ?><br> Articles - <?php echo $texts2; ?> <br> Comments - <?php echo $comm; ?></p>
        </div>
        <div style="position: absolute; top: 300; left: 50; width: 100px; text-align:left;">
            <button class="button" onclick="location.href='http://localhost/RCS/maincars.php'" type="button" style="vertical-align:middle"><span>Cars</span></button> <br> <br>
            <button class="button" onclick="location.href='http://localhost/RCS/maintexts.php'" type="button" style="vertical-align:middle"><span>Texts</span></button> <br> <br>
            <button class="button" onclick="location.href='http://localhost/RCS/addcar.php'" type="button" style="vertical-align:middle"><span>New car</span></button> <br> <br>
            <button class="button" onclick="location.href='http://localhost/RCS/addtext.php'" type="button" style="vertical-align:middle"><span>New text</span></button> <br> <br>
            <?php
            if($login_session == 'admin')
            {
               ?> 
                <button class="button" onclick="location.href='http://localhost/RCS/users.php'" type="button" style="vertical-align:middle; background-color: yellow;"><span>Users</span></button> <br> <br>
                <?php
            }
            ?>               
        </div>
        <div style="position: absolute; top: 10; left: 1700; width: 200px; text-align:right;">
            <h1><a href = "logout.php">Log Out</a></h1>
        </div>
        <div style="position: absolute; top: 930; left: 10; width: 300px; text-align:left;">
            <?php
                $result = mysqli_query($link, "SELECT * FROM LOGIN_DETAILS");
                $num_rows = mysqli_num_rows($result);
                echo "Site enter count - $num_rows";
            ?>
        </div>
        </div>	
    </body>
</html>
