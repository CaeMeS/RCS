<?php
   include('DBconn.php');
   session_start();   
   $user_check = $_SESSION['login_user'];
   $ses_sql = mysqli_query($link,"select login from USER where login = '$user_check' ");
   $row = mysqli_fetch_array($ses_sql,MYSQLI_ASSOC);
   $login_session = $row['login'];
   if(!isset($_SESSION['login_user'])){
      header("location:index.php");
   }
?>