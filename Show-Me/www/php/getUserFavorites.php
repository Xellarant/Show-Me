<?php
include "db.php";
session_start();
$userID = $_SESSION["userID"];
$data=array();
$q=mysqli_query($con,"SELECT movieID, userfavorites.title, userfavorites.imageURL, userfavorites.actor, userfavorites.genre, userfavorites.director, userfavorites.titleYear, babakari_movies.movies.description FROM `userfavorites` JOIN	babakari_movies.movies ON userfavorites.movieID = babakari_movies.movies.id WHERE userid=$userID");

if ($q) {
	while ($row=mysqli_fetch_object($q)){
		$data[]=$row;
	}
}
else {
	echo mysqli_error($con);
}

echo json_encode($data);
?>