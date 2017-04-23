<?php
    include("DBconn.php");
    include('verify.php');
    if($_SERVER["REQUEST_METHOD"] == "POST")
    {
        $temat = mysqli_real_escape_string($link, $_POST['temat']);
        $kategoria = mysqli_real_escape_string($link, $_POST['kategoria']);
        $intro = mysqli_real_escape_string($link, $_POST['intro']);
        $opis = mysqli_real_escape_string($link, $_POST['opis']);
        $result = mysqli_query($link, "SELECT id_user FROM USER WHERE login='$login_session'");
        $row = mysqli_fetch_row($result);
        $q=mysqli_query($link, "insert into TEKST (temat, kategoria, intro, tresc, id_tworcy) values ('$temat', '$kategoria', '$intro', '$opis', '$row[0]');");
        if (strlen (mysqli_error($link)) > 0) 
        {
            echo "Nie dodano!";
        } 
        else
        {            
            header("location: maintexts.php");
        }	 
    }
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>RCSaddtxt</title>
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
            .tx 
            {
                resize: none;
                overflow: hidden;
                min-height: 100px;
                max-height: 3000px;
                
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
    <div id="outer">
        <div id="middle">
            <div id="inner">
            <form name="form" method=post action="">
                <table align="center">
                <h1 align="center" { font-size: x-large }> <b> Add a new text </b> </h1>             
                <tr> 
                    <td align="center"> <input type="text" placeholder="topic" name="temat" size="50" maxlength="50"> </td>
                </tr>
                <tr> 
                    <td align="center"> <select name="kategoria">
                                                <option value="NEWS">news</option>
                                                <option value="FIRSTLOOK">first impressions</option>
                                                <option value="TEST">test</option>
                                                <option value="HISTORY">history</option>
                                        </select> </td> 
                </tr>			
                <tr> 
                    <td> <textarea placeholder="intro" name="intro" rows="3" cols="100" style="resize:none;" maxlength="291" required></textarea> </td>
                </tr>
                <tr> 
                    <td> <textarea class="tx" placeholder="text" name="opis" cols="100" onkeyup="auto_grow(this)" maxlength="5820" required></textarea> </td>                     
                </tr>
                <tr > 
                    <td> <button class="button" type="submit"> <b> Create it! </b>  </button> <button class="button" onclick="goBack()">GO BACK</button> </td> 
                </tr>
                </table>
            </form>
            </div>
        </div>
    </div>
    </body>
    <script>
        function auto_grow(element) 
        {
            element.style.height = "5px";
            element.style.height = (element.scrollHeight)+"px";
        }
        function goBack() 
        {
            window.history.back();
        }
    </script>
</html>