<?php
include "db.php";
session_start();
// Execution of this file assumes a session exists and the userID is in it!
if(isset($_POST['zipCode']))
{
	$zipCode = $_POST['zipCode'];
	$zipCode = filter_var($zipCode, FILTER_SANITIZE_STRING);
	$userID = $_SESSION['userID'];
	$result = mysqli_query($con, "UPDATE userprofiles SET zipCode = $zipCode WHERE userID = $userID");	
	
if($result)
	{
		echo "success";
		$_SESSION['zipCode'] = $zipCode;
	}
	else
	{
		echo "failed";
	}
echo mysqli_error($con);
}
?>