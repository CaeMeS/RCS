<?php
   include("DBconn.php");
   session_start();
    function begin()
    {
        mysqli_query($link, "BEGIN");
    }
    function commit()
    {
        mysqli_query($link, "COMMIT");
    }
    function rollback()
    {
        mysqli_query($link, "ROLLBACK");
    }
?> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>RCSregistry</title>
        <style type="text/css">             
            #outer {display: table; position: absolute; height: 100%; width: 100%;}
            #middle {display: table-cell; vertical-align: middle;}
            #inner {margin-left: auto; margin-right: auto; width: 400px;}
        </style>
        <script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
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
                <h1 align="center" { font-size: x-large }> <b> Welcome in new account creator </b> </h1>
<?php
     if($_SERVER["REQUEST_METHOD"] == "POST")
{
    $error = false;
    mysqli_query($link, "SET TRANSACTION ISOLATION LEVEL SERIALIZABLE");
    begin();
    $query = "SELECT login FROM USER WHERE login='$_POST[username]'";
    $result = mysqli_query($link, $query);
    $count = mysqli_num_rows($result);
    if($count!=0)
    {
        $error = true;
?>
                    <h2 align="center" style="color: red"> <?php echo "You can't create account with that login\r\n" . "<br>" . PHP_EOL; ?> </h2>
<?php      
    }   
    if($error == false)
    {      
        $imie = mysqli_real_escape_string($link, $_POST['imie']);
        $nazwisko = mysqli_real_escape_string($link , $_POST['nazwisko']);
        $login = mysqli_real_escape_string($link , $_POST['username']);
        $password = mysqli_real_escape_string($link , $_POST['password']);
        $gender = mysqli_real_escape_string($link , $_POST['gender']);      
		$salt = uniqid(mt_rand(), true);
		$pass = sha1(sha1($password) . sha1($salt));
        begin();
        $q=mysqli_query($link, "insert into USER (login, password, imie, nazwisko, gender, salt) values ('$login', '$pass', '$imie', '$nazwisko', '$gender', '$salt');");
        if (!$q) 
        {
            rollback(); 
            echo "Transaction rollback";
            exit;
        } 
        else
        {   
            commit();
            //echo $password;
            header("location: index.php");
        }	 
    }    
}
?>               
                <tr> 
                    <td bgcolor="white" onmouseover="this.bgColor='red'" onmouseout="this.bgColor='white'"> <input type="text" placeholder="first name" name="imie"> </td> 
                </tr>
                <tr> 
                    <td bgcolor="white" onmouseover="this.bgColor='red'" onmouseout="this.bgColor='white'"> <input type="text" placeholder="last name" name="nazwisko"> </td> 
                </tr>
                <tr> 
                    <td bgcolor="white" onmouseover="this.bgColor='red'" onmouseout="this.bgColor='white'"> <input id="username" type="text" placeholder="login" name="username" required onblur="check()"> </td>
                    <p align="center"> <span id="user-availability-status"></span> </p> 
                    <p align="center"><img src="loader.gif" id="loaderIcon" style="display:none" /></p>
                </tr>
				<script>
				function check()
				{
					var l = document.getElementById('username').value;
					if(l.length < 5 && l.length > 0)
					{
						alert("Not enough chars in -login-, must be more than 4 ;)")
						setTimeout("document.getElementById('1').focus()", 0);		
					}
                    else
                    {
                        $("#loaderIcon").show();
	                   jQuery.ajax({
	                   url: "checkdata.php",
	                   data:'username='+$("#username").val(),
	                   type: "POST",
	                   success:function(data)
                        {
		                      $("#user-availability-status").html(data);
		                      $("#loaderIcon").hide();
	                   },
	                   error:function (){}
	                   });
                    }
                }
				</script>
                <tr> 
                    <td bgcolor="white" onmouseover="this.bgColor='red'" onmouseout="this.bgColor='white'"> <input id="2" type="password" placeholder="password" name="password" required title="min 5 chars" onblur="checkpasslen()"> </td>
                </tr>  
                <tr> 
                    <td bgcolor="white" onmouseover="this.bgColor='red'" onmouseout="this.bgColor='white'"> <input id="3" type="password" placeholder="rewrite password" name="cpassword" required onblur="checkpass()"> </td>
                </tr>
                <script>
                function checkpasslen()
                {
                    var p = document.getElementById('2').value;
                    if(p.length < 6 && p.length > 0)
                    {
                        alert("Password must have more than 5 chars!");
                        setTimeout("document.getElementById('2').focus()", 0);	
                    }
                }   
                </script>
				<script>
				function checkpass()
				{
					var p = document.getElementById('2').value;
					var c = document.getElementById('3').value;
					if(p != c)
					{
						alert("Passwords not maching!")
						document.getElementById('3').value = "";							
					}               
				}
				</script>				
                <tr>
                    <td align="center"> Choose your gender </td>
                </tr>
                <tr>
                    <td align="left">  <input type="radio" name="gender" value="male" checked> Male <br>
                                    <input type="radio" name="gender" value="female"> Female <br>
                                    <input type="radio" name="gender" value="other"> Other <br>
                    </td>
                </tr>
                <tr > 
                    <td align="center"> <button type="submit"> <b> Create it! </b>  </button> </td> 
                </tr>
                <tr> 
                    <td align="center"> <a href="http://localhost/RCS/index.php" onmouseover="window.status='To login'; 
                                        return true" onmouseout="window.status=''; return true">Already have an account?</a> </td>
                </tr> 
                </table>
            </form>
            </div>
        </div>
    </div>
    </body>
</html>