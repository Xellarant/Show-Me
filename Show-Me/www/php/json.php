<?php
include "db.php";
session_start();
$userID = $_SESSION["userID"];
$data=array();
$q=mysqli_query($con,"select * from `user_favorites` where userid=$userID");
while ($row=mysqli_fetch_object($q)){
	$data[]=$row;
}
echo json_encode($data);
?>