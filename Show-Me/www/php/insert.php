<?php
include "db.php";
if(isset($_POST['insert']))
{
	$title=$_POST['title'];
	$genre=$_POST['genre'];
	$subgenre=$_POST['subgenre'];
	$q=mysqli_query($con,"INSERT INTO `user_favorites` (`title`,`genre`,`subgenre`) VALUES ('$title','$genre','$subgenre')");
	if($q)
		echo "success";
	else
		echo "error";
}
?>