<?php
    include("DBconn.php");
    $id = $_GET['id'];
    $sql = "DELETE FROM AUTO WHERE id_samochodu='$id'";
    $com = "DELETE FROM OPINIA WHERE id_kom_auto='$id'";
    if (mysqli_query($link, $sql)) 
    {
        if (mysqli_query($link, $com)) 
        {   
            header("location: maincars.php");
        }
    }
    else 
    {
        echo "Error deleting record: " . mysqli_error($link);
    }
?>