<!DOCTYPE HTML>
<html>
<body bgcolor="87ceeb">
<center><h2>Simple Library Management System</h2></center>
<!--Once the form is submitted, all the form data is forwarded to InsertBooks.php -->
<form action="InsertBooks.php" method="post">

<table border="2" align="center" cellpadding="5" cellspacing="5">
<tr>
<td> Enter ISBN :</td>
<td> <input type="text" name="isbn" size="48"> </td>
</tr>
<tr>
<td> Enter Publication Year:</td>
<td> <input type="text" name="pubyear" size="48"> </td>
</tr>
<tr>
<td> Enter Title :</td>
<td> <input type="text" name="title" size="48"> </td>
</tr>
<tr>
<td> Enter Author :</td>
<td> <input type="text" name="author" size="48"> </td>
</tr>
<tr>
<td> Enter Pages: </td>
<td> <input type="text" name="pages" size="48"> </td>
</tr>
<td> Enter Category: </td>
<td> <input type="text" name="category" size="48"> </td>
</tr>
<tr>
<td></td>
<td>
<input type="submit" value="submit">
<input type="reset" value="Reset">
</td>
</tr>
</table>
</form>
</body>
</html>