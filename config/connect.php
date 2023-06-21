<?php
    $server="localhost";
    $uname="root";
    $password="";
    $db="auction_db";
    $con=mysqli_connect($server,$uname,$password,$db);

    if(!$con){
        echo "connection Failed.....";
    }
?>