<?php
    include("DBconn.php");
    include('verify.php');
    $id = $_GET['id'];
    $query = mysqli_query($link, "SELECT * FROM AUTO WHERE id_samochodu = $id");
    $row = mysqli_fetch_row($query);
    $query2 = mysqli_query($link, "SELECT login FROM USER WHERE id_user = " . $row[2]);
    $row2 = mysqli_fetch_row($query2);
    if($_SERVER["REQUEST_METHOD"] == "POST")
    {      
        $tresc = mysqli_real_escape_string($link , $_POST['comment']);
        $q=mysqli_query($link, "insert into OPINIA (nazwa, tresc, id_kom_auto) values ('$login_session', '$tresc', '$id');"); 
    } 
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>RCScar</title>
        <style type="text/css">             
            #outer {display: table; position: absolute; height: 100%; width: 100%;}
            #middle {display: table-cell; vertical-align: middle;}
            #inner {margin-left: auto; margin-right: auto; width: 800px;}           
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
            a
            {
                text-decoration: none;
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
        <form name="form" method='post' action="">
        <div style="position: absolute; top: 10; left: 10; width: 400px; text-align:left;">
            <font size="3" face="Bedrock" color="black"> <i> Added by <?php echo htmlspecialchars($row2[0]); ?> on <?php echo $row[1]; ?> </i> </font> <br> <br>
        </div> 
    <div id="outer">
        <div id="middle">
            <div id="inner">       
                <table align="center"> 
                    <h1 align="center"> <font size="7" face="Arial Black" color="#fb9437"><?php echo htmlspecialchars($row[10]); echo htmlspecialchars(" $row[9]"); ?></font> </h1>
                    <td>
                        <tr>
                            <img src="cars/<?php echo $row[13]; ?>" alt="Car Photo" style="width:778px;height:432px;"> <br>
                        </tr>
                        <tr>
                            <font size="4" color="black" face="Bedrock">    Type: </font>
                        </tr>
                        <tr>
                            <font size="5" face="Bedrock"><?php echo htmlspecialchars($row[11]); echo htmlspecialchars(" $row[12]"); ?></font> <br>
                        </tr>
                        <tr>
                            <font size="4" color="black" face="Bedrock">Year of production: </font>
                        </tr>
                        <tr>
                            <font size="5" face="Bedrock"><?php echo $row[3]; ?></font> <br>
                        </tr>
                        <tr>
                            <font size="4" color="black" face="Bedrock">Engine type: </font>
                        </tr>
                        <tr>
                            <font size="5" face="Bedrock"><?php echo htmlspecialchars($row[6]); ?></font> <br>
                        </tr>
                         <tr>
                            <font size="4" color="black" face="Bedrock">bHP: </font>
                        </tr>
                        <tr>
                            <font size="5" face="Bedrock"><?php echo htmlspecialchars($row[4]); ?>HP</font> <br>
                        </tr>
                        <tr>
                            <font size="4" color="black" face="Bedrock">V-max: </font>
                        </tr>
                        <tr>
                            <font size="5" face="Bedrock"><?php echo htmlspecialchars($row[7]); ?>km/h</font> <br>
                        </tr>
                        <tr>
                            <font size="4" color="black" face="Bedrock">0/100km/h: </font>
                        </tr>
                        <tr>
                            <font size="5" face="Bedrock"><?php echo htmlspecialchars($row[5]); ?>s</font> <br> <br>
                        </tr>
                        <div style="color: black; font-size: 15pt; word-wrap: break-word;">
                            <?php echo htmlspecialchars("\t$row[8]"); ?> <br> <br> <br>
                            <button class="button" onclick="location.href='maincars.php'" type="button" name="back"> GO BACK </button> 
                            <?php 
                                if($login_session == $row2[0] || $login_session == 'admin')
                                {
                                ?>
                                    <button class="button" onclick="location.href='http://localhost/RCS/deletecar.php?id=<?php echo $id; ?>'" type="button" name="delete"> DELETE </button> 
                                    <button class="button" onclick="location.href='http://localhost/RCS/updatecar.php?id=<?php echo $id; ?>'" type="button" name="update"> UPDATE </button> <br> <br>
                                <?php
                                }
                                else
                                {
                                    ?>
                                    <br> <br>
                                <?php
                                }                                                               
                                ?>                        
                            <a href = "https://allegro.pl/samochody-osobowe-4029?string=<?php echo $row[10]; ?>%20<?php echo $row[9]; ?>&bmatch=base-relevance-floki-5-nga-aut-1-3-0222" target="_blank"> <img border="0" src="allegro.png" alt="allegro" style="width:110px;height:50px;" style="text-decoration: none"> </a>
                            <a href = "https://www.google.pl/?gfe_rd=cr&ei=RU7FWOTwPOev8we8gIHQAQ#q=<?php echo $row[10]; ?>+<?php echo $row[9]; ?>&*%20" target="_blank"> <img border="0" src="google.png" alt="google" style="width:140px;height:50px;" style="text-decoration: none"> </a> <br> <br>
                        </div>            
                <textarea style="color: black; background-color: grey; font-size: 12pt; font-weight: bold; resize:none; border:groove 4px black " name="comment" placeholder="Write Your Comment Here....." cols = "50" maxlength="180" required></textarea>
                <input class="button" type="submit" value="Post Comment"> <br> <br>
                       
                    <?php 
                    $comm ="select nazwa, tresc, data from OPINIA where id_kom_auto = $id order by data desc";
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
                    </td>                  
                </table>
            </div>
        </div>  
    </div>
    </form>
    </body>
</html>