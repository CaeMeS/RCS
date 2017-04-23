<?php
    include("DBconn.php");
    include('verify.php');
    $id = $_GET['id'];
    $query = mysqli_query($link, "SELECT * FROM TEKST WHERE id_tekstu = $id");
    $row = mysqli_fetch_row($query);
    $query2 = mysqli_query($link, "SELECT login FROM USER WHERE id_user = " . $row[6]);
    $row2 = mysqli_fetch_row($query2);
    if($_SERVER["REQUEST_METHOD"] == "POST")
    {       
        $tresc = mysqli_real_escape_string($link , $_POST['comment']);
        $q=mysqli_query($link, "insert into OPINIA (nazwa, tresc, id_komentarza) values ('$login_session', '$tresc', '$id');"); 
    } 
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>RCStxt</title>
        <style type="text/css">             
            #outer {display: table; position: absolute; height: 100%; width: 100%;}
            #middle {display: table-cell; vertical-align: middle;}
            #inner {margin-left: auto; margin-right: auto; width: 800px;}
            #lol {margin-left: auto; margin-right: auto; width: 1400px;}
            p.sansserif 
            {
                font-family: "Arial Black", Gadget, sans-serif;
            }
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
        <div style="position: absolute; top: 10; left: 10; width: 400px; text-align:left;">
            <font size="3" face="Bedrock" color="black"> <i> Added by <?php echo htmlspecialchars($row2[0]); ?> on <?php echo $row[1]; ?> </i> </font>			
        </div> 
        
    <div id="outer">
        <div id="middle">
            <div id="lol">
                <br> <br>
                <div style="color: orange; font-size: 40pt; font-weight: bold">
                    <?php echo htmlspecialchars($row[2]); ?>
                </div>
                <div style="color: black; font-size: 17pt; font-weight: bold; width: 800px; word-wrap: break-word;">
                    <?php echo htmlspecialchars("$row[4]"); ?> <br> <br>
                </div>
                <div style="color: black; font-size: 15pt; width: 1400px; word-wrap: break-word;">
                    <?php echo htmlspecialchars("$row[5]"); ?> <br> <br> <br> <br>
                    <button class="button" onclick="location.href='maintexts.php'" type="button" name="back"> GO BACK </button> 
                            <?php 
                                if($login_session == $row2[0] || $login_session == 'admin')
                                {
                                ?>
                                    <button class="button" onclick="location.href='http://localhost/RCS/deletetxt.php?id=<?php echo $id; ?>'" type="button" name="delete"> DELETE </button> 
                                    <button class="button" onclick="location.href='http://localhost/RCS/updatetxt.php?id=<?php echo $id; ?>'" type="button" name="update"> UPDATE </button> <br> <br>
                                <?php
                                }
                                else
                                {
                                    ?>
                                    <br> <br>
                                <?php
                                }                                                               
                                ?>
                </div>  
                <form name="form" method='post' action="">
                <textarea style="color: black; background-color: grey; font-size: 12pt; font-weight: bold; resize:none; border:groove 4px black " name="comment" placeholder="Write Your Comment Here....." cols = "50" maxlength="180" required></textarea>
                <input class="button" type="submit" value="Post Comment"> <br> <br>
                </form>
                    <?php 
                    $comm ="select nazwa, tresc, data from OPINIA where id_komentarza = $id order by data desc";
                    $result = mysqli_query($link, $comm);   
                    while($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
                    {                    
	                   $name=$row['nazwa'];
	                   $comment=$row['tresc'];
                        $time=$row['data'];                       
                    ?>
                <div style="color: #bfc1c1; font-size: 12pt;">
                   <p>Posted By <span style="color: black;"> <?php echo htmlspecialchars($name);?> </span></p>
                         <p style="color: #FF9933; font-size: 15pt; max-width: 600px; word-wrap: break-word;"><?php echo htmlspecialchars($comment);?></p>
	                       <p ><?php echo $time;?></p>
                    <hr>
                </div>      
                    <?php
                        }
                    ?>
            </div>
        </div>
    </div>
    </body>
</html>

