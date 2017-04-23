<?php 
$link = mysqli_connect("127.0.0.1", "kaszczep") or die ("błąd połączenia: " . mysqli_connect_error ());
$db_selected = mysqli_select_db($link, 'test');
  if (!$db_selected) {
    die ("Can\'t use lol : " . mysqli_error($link));
  }
?>


