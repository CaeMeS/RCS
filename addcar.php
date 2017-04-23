<?php
    include("DBconn.php");
    include('verify.php');
    if($_SERVER["REQUEST_METHOD"] == "POST")
    {
        if(isset($_FILES['image']))
        {
            $errors= array();
            $file_name = $_FILES['image']['name'];
            $file_size =$_FILES['image']['size'];
            $file_tmp =$_FILES['image']['tmp_name'];
            $file_type=$_FILES['image']['type'];
            $file_ext=strtolower(end(explode('.',$_FILES['image']['name'])));     
            $expensions= array("jpeg","jpg","png");      
            if(in_array($file_ext,$expensions)=== false)
            {
                $errors[]="choose a JPEG or PNG file";
            }    
            if($file_size > 5242880)
            {
                $errors[]='File size must be less than 5 MB';
            }    
            if(empty($errors)==true)
            {
                move_uploaded_file($file_tmp,"cars/".$file_name);
                chmod("cars/".$file_name, 0777);
                chown("cars/".$file_name, kaszczep);
                $marka = mysqli_real_escape_string($link, $_POST['marka']);
                $model = mysqli_real_escape_string($link, $_POST['model']);
                $typ = mysqli_real_escape_string($link, $_POST['typ']);
                $naped = mysqli_real_escape_string($link, $_POST['naped']);
                $rok = mysqli_real_escape_string($link, $_POST['rok']);
                $moc = mysqli_real_escape_string($link, $_POST['moc']);
                $przyspieszenie = mysqli_real_escape_string($link, $_POST['przyspieszenie']);
                $silnik = mysqli_real_escape_string($link, $_POST['silnik']);
                $Vmax = mysqli_real_escape_string($link, $_POST['Vmax']);
                $opis = mysqli_real_escape_string($link, $_POST['opis']);
                $foto = $file_name;
                $result = mysqli_query($link, "SELECT id_user FROM USER WHERE login='$login_session'");
                $row = mysqli_fetch_row($result);
                $q=mysqli_query($link, "insert into AUTO (id_user, rok, moc, przyspieszenie, silnik, Vmax, opis, model, marka, typ, naped, foto) values ('$row[0]', '$rok', '$moc', '$przyspieszenie', '$silnik', '$Vmax', '$opis', '$model', '$marka', '$typ', '$naped', '$foto');");
                if (strlen (mysqli_error($link)) > 0) 
                {
                    echo "Nie dodano!";
                } 
                else
                {            
                    header("location: maincars.php");
                }	 
            }
            else
            {
                print_r($errors);
            }
        }       
    }
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>RCSaddcar</title>
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
                <h1 class='title'> <b> Add a new car </b> </h1>             
                <tr> 
                    <td> <input type="text" placeholder="brand" name="marka" size="28" required maxlength="20"> </td>
                    <td> <input type="text" placeholder="model" name="model" required maxlength="20"> </td>
                    <td> <select placeholder="type" name="typ">
                                                <option value="sedan">sedan</option>
                                                <option value="combi">combi</option>
                                                <option value="coupe">coupe</option>
                                                <option value="off-road">off-road</option>
                                                <option value="suv">SUV</option>
                                                <option value="hatchback">hatchback</option>
                                                <option value="cabrio">cabrio</option>
                                                <option value="racing">racing</option>
                        </select> </td>
                </tr>
                <tr> 
                    <td> <select placeholder="type" name="naped">
                                                <option value="4x4">4x4</option>
                                                <option value="FWD">FWD</option>
                                                <option value="RWD">RWD</option>
                        </select> </td> 
                    <td> <input type="text" id="1" placeholder="year" name="rok" required onblur="checkyear()" maxlength="4"> </td>
                    <td> <input type="text" placeholder="HP" name="moc" size="26" required maxlength="4"> </td>
                </tr>
                <tr> 
                    <td> <input type="text" placeholder="acceleration" name="przyspieszenie" size="28" required maxlength="5"> </td>
                    <td> <input type="text" placeholder="engine" name="silnik" required maxlength="15" > </td>
                    <td> <input type="text" placeholder="Vmax" name="Vmax" size="26" required maxlength="4"> </td>
                </tr>				
                <tr> 
                    <td colspan="3"> <textarea placeholder="describtion" style="resize:none" name="opis" rows="10" cols="100" maxlength="970"></textarea> </td>
                </tr>
                <tr > 
                    <td> Add photo</td>
                </tr>
                <tr > 
                    <td> <input class="button" type="file" name="image" /> <br> <br>
                </tr>
                <tr > 
                    <td> <button class="button" type="submit"> <b> Create it! </b>  </button> <button class="button" onclick="goBack()">GO BACK</button> </td> 
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
                    function goBack() 
                    {
                        window.history.back();
                    }
				</script>
            </div>
        </div>
    </div>
    </body>
</html>