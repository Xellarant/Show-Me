<?php
include "db.php";
if(isset($_GET['remove']))
{

	$userID = $_SESSION['userID'];
	$movieID=$_GET['movieID'];

	$q=mysqli_query($con,"DELETE FROM `userFavorites` WHERE `movieID` = $movieID");
	if($q)
		echo "success";
	else
		echo "error";
}
?>