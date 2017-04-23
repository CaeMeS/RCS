<?php
    include("DBconn.php");
    include('verify.php');
    $id = $_GET['id'];
    $sql = "DELETE FROM TEKST WHERE id_tekstu='$id'";
    $com = "DELETE FROM OPINIA WHERE id_komentarza='$id'";
    if (mysqli_query($link, $sql)) 
    {
        if (mysqli_query($link, $com)) 
        {   
            header("location: maintexts.php");
        }
    } 
    else 
    {
        echo "Error deleting record: " . mysqli_error($link);
    }
?>