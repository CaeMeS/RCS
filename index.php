<?php
   include("DBconn.php");
   session_start(); 
function getUserIP()
{
    $client  = @$_SERVER['HTTP_CLIENT_IP'];
    $forward = @$_SERVER['HTTP_X_FORWARDED_FOR'];
    $remote  = $_SERVER['REMOTE_ADDR'];

    if(filter_var($client, FILTER_VALIDATE_IP))
    {
        $ip = $client;
    }
    elseif(filter_var($forward, FILTER_VALIDATE_IP))
    {
        $ip = $forward;
    }
    else
    {
        $ip = $remote;
    }

    return $ip;
}

$user_agent     =   $_SERVER['HTTP_USER_AGENT'];

function getOS() 
{

global $user_agent;

$os_platform    =   "Unknown OS Platform";

$os_array       =   array(
                        '/windows nt 10/i'      =>  'Windows 10',
                        '/windows nt 6.3/i'     =>  'Windows 8.1',
                        '/windows nt 6.2/i'     =>  'Windows 8',
                        '/windows nt 6.1/i'     =>  'Windows 7',
                        '/windows nt 6.0/i'     =>  'Windows Vista',
                        '/windows nt 5.2/i'     =>  'Windows Server 2003/XP x64',
                        '/windows nt 5.1/i'     =>  'Windows XP',
                        '/windows xp/i'         =>  'Windows XP',
                        '/windows nt 5.0/i'     =>  'Windows 2000',
                        '/windows me/i'         =>  'Windows ME',
                        '/win98/i'              =>  'Windows 98',
                        '/win95/i'              =>  'Windows 95',
                        '/win16/i'              =>  'Windows 3.11',
                        '/macintosh|mac os x/i' =>  'Mac OS X',
                        '/mac_powerpc/i'        =>  'Mac OS 9',
                        '/linux/i'              =>  'Linux',
                        '/ubuntu/i'             =>  'Ubuntu',
                        '/iphone/i'             =>  'iPhone',
                        '/ipod/i'               =>  'iPod',
                        '/ipad/i'               =>  'iPad',
                        '/android/i'            =>  'Android',
                        '/blackberry/i'         =>  'BlackBerry',
                        '/webos/i'              =>  'Mobile'
                     );

foreach ($os_array as $regex => $value) {

 if (preg_match($regex, $user_agent)) {
    $os_platform    =   $value;
 }

}

return $os_platform;

}

function getBrowser() {

global $user_agent;

$browser        =   "Unknown Browser";

$browser_array  =   array(
                         '/msie/i'       =>  'Internet Explorer',
                         '/firefox/i'    =>  'Firefox',
                         '/safari/i'     =>  'Safari',
                         '/chrome/i'     =>  'Chrome',
                         '/opera/i'      =>  'Opera',
                         '/netscape/i'   =>  'Netscape',
                         '/maxthon/i'    =>  'Maxthon',
                         '/konqueror/i'  =>  'Konqueror',
                         '/mobile/i'     =>  'Handheld Browser'
                   );

foreach ($browser_array as $regex => $value) {

  if (preg_match($regex, $user_agent)) {
     $browser    =   $value;
  }

}

return $browser;

}
foreach($_POST as $k=>$v) 
{
    $_POST[$k] = mysqli_real_escape_string($link, $v);
}
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>RCSlogin</title>
        <style>
             #outer {display: table; position: absolute; height: 100%; width: 100%;}
             #middle {display: table-cell; vertical-align: middle;}
             #inner {margin-left: auto; margin-right: auto; width: 400px;}
            h1 {
	font-family: Copperplate, "Copperplate Gothic Light", fantasy;
	font-size: 42px;
	font-style: italic;
	font-variant: small-caps;
	font-weight: bold;
	line-height: 44px;
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
	<div style="position: absolute; top: 10; left: 10; width: 400px; text-align:left;">
            <h2 style="color: #12A5FF; font-size: 20px;"> <i> Optimized for Google Chrome </i> </h2>  
        </div> 
        <div id="outer">
        <div id="middle">
            <div id="inner">
            <form method=post action="">
                <table align="center">
                    <tr> 
                        <td> <img src="RCS.png" style="width:150px;height:150px;"> </td> 
                        <td> <h1> Random Car Site </h1> </td>
                    </tr>
                </table>
                <table align="center">
                <?php
                    if($_SERVER["REQUEST_METHOD"] == "POST") 
                    {
                        $login = mysqli_real_escape_string($link,$_POST['login']);
                        $password = mysqli_real_escape_string($link, stripslashes($_POST['password']));
	                    $qu = "SELECT salt FROM USER WHERE login = '$login' ";
                        $res = mysqli_query($link, $qu);
                        $row = mysqli_fetch_array($res, MYSQL_ASSOC);
                        $pass = sha1(sha1($password) . sha1($row['salt']));	
                        $sql = "SELECT id_user FROM USER WHERE login = '$login' and password = '$pass' and deletecomment IS NULL";
                        $result = mysqli_query($link,$sql);
                        $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
                        $count = mysqli_num_rows($result);
                        $todelete = "SELECT id_user, deletecomment FROM USER WHERE login = '$login' and password = '$pass' and deletecomment IS NOT NULL";
                        $result2 = mysqli_query($link,$todelete);
                        $rowtd = mysqli_fetch_row($result2);
                        $count2 = mysqli_num_rows($result2);
                        if($count == 1) 
                        {
			                 $user_ip = getUserIP();
			                 $user_os = getOS();
			                 $user_browser = getBrowser();
			                 $qip = mysqli_query($link, "insert into LOGIN_DETAILS (ip, user, OS, browser) values ('$user_ip', '$login', '$user_os', '$user_browser');");
			                 $_SESSION['login_user'] = $login; 
			                 header("location: main.php"); 
                        }
                        else if($count2 == 1)
                        {
                            ?>
                            <h2 align="center" style="color: red"> Your account has been deleted becouse: <?php echo $rowtd[1]; ?> </h2> 
                            <?php 
                            $erase = "DELETE FROM USER WHERE id_user='$rowtd[0]'";
                            if (mysqli_query($link, $erase)) { }
                            else 
                            {
                                echo "Error deleting record: " . mysqli_error($link);
                            }
                        }
                        else
                        {
                            ?>
                            <h2 align="center" style="color: red"> Invalid login or password </h2> 
                            <?php
                        }
                    }
                ?>
                <tr> 
                    <td bgcolor="white" onmouseover="this.bgColor='red'" onmouseout="this.bgColor='white'"> <input type="text" placeholder="login" name="login" required title="Enter Your e-mail"> </td> 
                </tr>
                <tr> 
                    <td bgcolor="white" onmouseover="this.bgColor='red'" onmouseout="this.bgColor='white'"> <input type="password" placeholder="password" name="password" required title="Be hacker proof!"> </td>
                </tr>                 
                <br> <br>                
                <tr> 
                    <td align="center"> <button type="submit"> <b> Let's go! </b>  </button> </td> 
                </tr> 
                <tr> 
                    <td align="center"> <a href="http://localhost/RCS/registration.php" onmouseover="window.status='To account creator'; 
                                        return true" onmouseout="window.status=''; return true">Create Account</a> </td>
                </tr> 
                </table>
            </form>
            </div>
        </div>
    </div>
    </body>
</html>
