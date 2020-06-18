<?php
    session_start();
?>

<!DOCTYPE HTML>
<html>
<body bgcolor="87ceeb">
<center><h2>Simple Library Management System</h2></center>
<br>

<?php
include("dbconnect.php");

$search = $_REQUEST["search"];


$query = "SELECT *
from books
where b_title like '$search'";
$result = mysqli_query($db,$query);

if(mysqli_num_rows($result)>0)if(mysqli_num_rows($result)>0)


{
?>

<table border="2" align="center" cellpadding="5" cellspacing="5">

<tr>
<th> ISBN </th>
<th> Publication </th>
<th> Title </th>
<th> Author </th>
<th> Pages </th>
<th> Category </th>
</tr>

<?php while($row = mysqli_fetch_assoc($result))
{
?>
<tr>
<td><?php echo $S_SESSION["ISBN"];?> </td>
<td><?php echo $row["pub_year"];?> </td>
<td><?php echo $row["b_title"];?> </td>
<td><?php echo $row["b_author"];?> </td>
<td><?php echo $row["no_pages"];?> </td>
<td><?php echo $row["cat_name"];?> </td>
</tr>
<?php
}
}

else
echo "<center>No books found in the library by the name $search </center>" ;

?>

</table>
</body>
</html>
<br>