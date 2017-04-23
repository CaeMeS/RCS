<?php
    include("DBconn.php");
    include('verify.php');
    $sql = "DELETE FROM USER WHERE login='$login_session'";
    if (mysqli_query($link, $sql)) 
    { 
        header("location: index.php");
    }
    else 
    {
        echo "Error deleting record: " . mysqli_error($link);
    }
?>