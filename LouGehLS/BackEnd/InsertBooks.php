<!DOCTYPE HTML>
<html>
<body bgcolor="87ceeb">
<center><h2>Simple Library Management System</h2></center>
<br>

<?php
include("dbconnect.php");

$isbn=$_POST['ISBN'];
$pubyear=$_POST['pub_year'];
$title=$_POST['b_title'];
$author=$_POST['b_author'];
$pages=$_POST['no_pages'];
$category=$_POST['cat_name'];

$query = "INSERT INTO `books`(`ISBN`,`pub_year`,`b_title`,`b_author`,`no_pages`,`cat_name`) 
VALUES('$isbn','$pubyear','$title','$author','$pages','$category')"; //Insert query to add book details into the book_info table
$result = mysqli_query($db,$query);

?>

<h3> Book information is inserted successfully </h3>

<a href="SearchBooks.php"> To search for the Book information click here </a>

</body>
</html>