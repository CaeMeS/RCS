<?php
    include("DBconn.php");
    include('verify.php');
    $id = $_GET['id'];
    $q = mysqli_query($link, "select marka, model, rok, moc, przyspieszenie, silnik, Vmax, opis from AUTO where id_samochodu = $id");
    $row = mysqli_fetch_row($q);
    if($_SERVER["REQUEST_METHOD"] == "POST")
    {
        $marka = mysqli_real_escape_string($link, $_POST['marka']);
        $model = mysqli_real_escape_string($link, $_POST['model']);
        $rok = mysqli_real_escape_string($link, $_POST['rok']);
        $przyspieszenie = mysqli_real_escape_string($link, $_POST['przyspieszenie']);
        $silnik = mysqli_real_escape_string($link, $_POST['silnik']);
        $Vmax = mysqli_real_escape_string($link, $_POST['Vmax']);
        $opis = mysqli_real_escape_string($link, $_POST['opis']);
        $query = mysqli_query ($link, "UPDATE AUTO SET model = '$model', marka = '$marka', rok = '$rok', moc = '$moc', przyspieszenie = '$przyspieszenie', silnik = '$silnik', Vmax = '$Vmax', opis = '$opis' WHERE id_samochodu='$id'");
        if( $query === FALSE ) 
        {
            echo mysqli_error($link);
        }
        else
        {
            header("location: maincars.php");
        }
    }
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>RCScar-update</title>
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
                <h1 class='title'> <b> Update a car </b> </h1>             
                <tr> 
                    <font size="5" face="Bedrock">Brand</font> <br>
                 <input type="text" name="marka" required maxlength="20" value="<?php echo htmlspecialchars($row[0]); ?>"> <br>
                    <font size="5" face="Bedrock">Model</font> <br>
                 <input type="text" name="model" required maxlength="20" value="<?php echo htmlspecialchars($row[1]); ?>"> <br>
                    <font size="5" face="Bedrock">Year</font> <br>
                 <input type="text" id="1" name="rok" required onblur="checkyear()" maxlength="4" value="<?php echo htmlspecialchars($row[2]); ?>"> <br>
                    <font size="5" face="Bedrock">HP</font> <br>
                 <input type="text" name="moc" required maxlength="4" value="<?php echo htmlspecialchars($row[3]); ?>"> <br>
                    <font size="5" face="Bedrock">Acceleration</font> <br>
                 <input type="text" name="przyspieszenie" required maxlength="5" value="<?php echo htmlspecialchars($row[4]); ?>"> <br>
                    <font size="5" face="Bedrock">Engine</font> <br>
                 <input type="text" name="silnik" required maxlength="15" value="<?php echo htmlspecialchars($row[5]); ?>"> <br>
                    <font size="5" face="Bedrock">Vmax</font> <br>
                 <input type="text" name="Vmax" required maxlength="4" value="<?php echo htmlspecialchars($row[6]); ?>"> <br>
                    <font size="5" face="Bedrock">Describtion</font> <br>
                 <textarea style="resize:none" name="opis" rows="10" cols="100" maxlength="970"> <?php echo htmlspecialchars($row[7]); ?> </textarea> <br>
                 <button class="button" type="submit"> <b> Update it! </b>  </button>
                </tr>
                </table>
            </form>
                <script>				
                function checkyear()
				{
					var l = document.getElementById('1').value;
					if((l.length != 4 || isNaN(l)) && l.length > 0)
					{
						alert("Year must have 4 digits")
						setTimeout("document.getElementById('1').focus()", 0);		
					}									
				}
				</script>
            </div>
        </div>
    </div>
    </body>
</html>