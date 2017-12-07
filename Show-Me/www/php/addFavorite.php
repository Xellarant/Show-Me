<?php
include "db.php";
if(isset($_POST['add']))
{
	session_start();

	$userID = $_SESSION['userID'];
	$movieID=$_POST['movieID'];
	$title=$_POST['title'];
	$year=$_POST['year'];
	$image_url=$_POST['image_url'];
	$genre=$_POST['genre'];
	$actor=$_POST['actor'];
	$director=$_POST['director'];
	$q=mysqli_query($con,"INSERT INTO `userfavorites` (`userID`, `movieID`,`title`, `titleYear`, `imageURL`, `genre`,`actor`, `director`) VALUES ('$userID', '$movieID', '$title', '$year', '$image_url', '$genre','$actor', '$director')");
	if($q)
		echo "success";
	else
		echo "error";
	echo mysqli_error($con);
}
?>