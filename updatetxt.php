<?php
    include("DBconn.php");
    include('verify.php');
    $id = $_GET['id'];
    $q = mysqli_query($link, "select temat, intro, tresc from TEKST where id_tekstu = $id");
    $row = mysqli_fetch_row($q);
    if($_SERVER["REQUEST_METHOD"] == "POST")
    {
        $temat = mysqli_real_escape_string($link, $_POST['temat']);
        $intro = mysqli_real_escape_string($link, $_POST['intro']);
        $tresc = mysqli_real_escape_string($link, $_POST['tresc']);
        $query = mysqli_query ($link, "UPDATE TEKST SET temat = '$temat', intro = '$intro', tresc = '$tresc' WHERE id_tekstu='$id'");
        if( $query === FALSE ) 
        {
            echo mysqli_error($link);
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
        <title>RCStxt-update</title>
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
    <div id="outer">
        <div id="middle">
            <div id="inner">
            <form name="form" method=post action="">
                <table align="center">
                <h1 align="center" { font-size: x-large }> <b> Update text </b> </h1>             
                <tr> 
                    <td align="center"> <input type="text" name="temat" size="50" maxlength="50" value="<?php echo htmlspecialchars($row[0]); ?>"> </td>
                </tr>		
                <tr> 
                    <td> <textarea name="intro" rows="3" cols="100" style="resize:none;" maxlength="291" required> <?php echo htmlspecialchars($row[1]); ?> </textarea> </td>
                </tr>
                <tr> 
                    <td> <textarea name="tresc" rows="20" cols="100" style="resize:none;" onkeyup="auto_grow(this)" maxlength="5820" required> <?php echo htmlspecialchars($row[2]); ?> </textarea> </td>
                </tr>
                <tr > 
                    <td> <button class="button" type="submit"> <b> Update it! </b>  </button> </td> 
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
    </script>
</html>