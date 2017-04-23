<?php
    include("DBconn.php");
    include('verify.php');
    $id = $_GET['id'];
    $sql = "DELETE FROM USER WHERE id_user='$id'";
    if (mysqli_query($link, $sql)) 
    { 
        header("location: users.php");
    }
    else 
    {
        echo "Error deleting record: " . mysqli_error($link);
    }
?>