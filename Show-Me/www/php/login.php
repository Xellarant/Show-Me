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

		$stmt = $con->prepare("SELECT firstname, lastname, email, zipCode from `userprofiles` where `userID`='$userID'");
		$stmt->execute();
		$stmt->bind_result($firstname, $lastname, $email, $zipCode);
		$stmt->fetch();

		$_SESSION['firstname'] = $firstname;
		$_SESSION['lastname'] = $lastname;
		$_SESSION['email'] = $email;
		$_SESSION['zipCode'] = $zipCode;

		echo "success";
	}
	else
	{
		echo "failed";
	}
	echo mysqli_error($con);
	$stmt->close();
}
echo mysqli_error($con);
?>