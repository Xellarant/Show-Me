<?php
include "db.php";
if(isset($_POST['login']))
{
	session_start();
	$username = $_POST['username'];
	//$username = filter_var($username, FILTER_SANITIZE_STRING);
	$password = $_POST['password'];
	//$password = hash('sha512', $password);
	$stmt = $con->prepare("SELECT userid, username from `users` where `username`='$username' and `password`='$password'");
	$stmt->execute();
	$stmt->store_result();
	$stmt->bind_result($userID, $username);
	$stmt->fetch();

	$login=$stmt->num_rows;
	//echo "login: ".$login;
	if($login!=0)
	{
		$_SESSION['username'] = $username;		
		$_SESSION['userID'] = $userID;

		echo "success";
	}
	else
	{
		echo "failed";
	}
	echo mysqli_error($con);
	$stmt->close();
}
?>