<?php

    $dbhost = 'localhost';
    $username ='Jack';
    $password ='Frost';

    $db = new mysqli("$dbhost","$username","$password");
    $query = "SELECT b_title FROM books";
    $result = mysqli_query($db,$query);

    $_SESSION['ISBN'] = $result;

   // print_r($);
    
?>
