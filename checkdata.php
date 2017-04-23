<?php
include("DBconn.php");
if(!empty($_POST["username"])) {
  $result = mysqli_query($link, "SELECT count(*) FROM USER WHERE login='" . $_POST["username"] . "'");
  $row = mysqli_fetch_row($result);
  $user_count = $row[0];
  if($user_count>0) {
      echo "<span class='status-not-available'> Username Not Available.</span>";
  }else{
      echo "<span class='status-available'> Username Available.</span>";
  }
}
?>