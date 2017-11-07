<?php
include "db.php";
if(isset($_POST['login']))
{
	$email = $_POST['email'];
	$email = filter_var($email, FILTER_SANITIZE_STRING);
	$password = $_POST['password'];
	$password = filter_var($password, FILTER_SANITIZE_STRING);
	$login=mysqli_num_rows(mysqli_query($con, "SELECT * from `phonegap_login` where `email`='$email' and `password`='$password'"));
	if($login!=0)
	{
		echo "success";
	}
	else
	{
		echo "failed";
	}
	echo mysqli_error($con);
}
?>