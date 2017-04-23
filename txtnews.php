<?php
    include("DBconn.php");
    include('verify.php');
    $date = date('Y-m-d');
    echo $date;
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>RCStxts-news</title>
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
.buttonshall {
    background-color: #FF0033; 
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    -webkit-transition-duration: 0.4s;
    transition-duration: 0.4s;
}
.buttonshadow {
    background-color: #FF9933; 
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    -webkit-transition-duration: 0.4s;
    transition-duration: 0.4s;
}
.buttonsha:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
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
        <div style="position: absolute; top: 40; left: 100; width: 400px; text-align:left;">
            <h1 style="color: #12A5FF">Welcome <?php echo htmlspecialchars($login_session); ?> on </h1>  
        </div> 
            <div style="position: absolute; top: 80; left: 750; width: 1200px; text-align:left;"> 
                <table>
                    <tr> 
                        <td> <img src="RCS.png" style="width:150px;height:150px;"> </td> 
                        <td> <h1 class="lol"> Random Car Site </h1> </td>
                    </tr>
                </table>
        </div> 
        <div style="position: absolute; top: 300; left: 50; width: 400px; text-align:left;">
            <form class="form-wrapper" name="form" method=post action="">
                <input type="text" name="szukaj" placeholder="Search for..." required>
                <input type="submit" value="go" id="submit">
            </form>   
            <button class="button" onclick="location.href='http://localhost/RCS/maincars.php'" type="button" style="vertical-align:middle"><span>Cars</span></button> <br> <br>
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
        <div style="position: absolute; top: 260; left: 400; width: 1000px; text-align:left;">
            <button class="buttonshadow buttonsha" onclick="location.href='http://localhost/RCS/txthistory.php'" type="button">History</button> 
            <button class="buttonshadow buttonsha" onclick="location.href='http://localhost/RCS/txttest.php'" type="button">Test</button> 
            <button class="buttonshall buttonsha" onclick="location.href='http://localhost/RCS/maintexts.php'" type="button">Show All</button> 
            <button class="buttonshadow buttonsha" onclick="location.href='http://localhost/RCS/txtfl.php'" type="button">First Look</button> <br> 
            <p style="font-size: 20px; color: #FF9933;"> Category: NEWS </p> <br>
           <?php 
            if($_SERVER["REQUEST_METHOD"] == "POST")
                {
                    $szukaj = mysqli_real_escape_string($link, $_POST['szukaj']);
                    $txt ="select id_tekstu, temat, kategoria from TEKST where temat like '%$szukaj%' and kategoria = 'NEWS' order by data_publikacji desc";
                    ?>
                    <p style="font-size: 20px; color: black;"> Search for: <i> <?php echo htmlspecialchars("$szukaj "); ?> </i> 
                    <button style="color: #FF0033" onclick="location.href='http://localhost/RCS/maintexts.php'" type="button">X</button> </p>  <br> <br>
                    <?php
                }
                else
                {
                    $txt ="select id_tekstu, temat, kategoria from TEKST where kategoria = 'NEWS' order by data_publikacji desc";
                }
                    $result = mysqli_query($link, $txt);   
                    while($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
                    {                    
	                       $idtxt=$row['id_tekstu'];
	                       $temat=$row['temat'];
                           $kat=$row['kategoria'];   
                    ?>
                    <div style="font-size: 25pt;">
                        <a style="text-decoration: none" href = "text.php?id=<?php echo $idtxt; ?>" > <?php echo htmlspecialchars($temat); ?> </a> <br> <br>
                    </div>      
                    <?php
                        }
                    ?>
        </div>
        <div style="position: absolute; top: 10; left: 1700; width: 200px; text-align:right;">
            <h1><a href = "main.php">Main page</a></h1>
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
