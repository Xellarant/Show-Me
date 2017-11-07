<?php
include "db.php";
if(isset($_POST['signup']))
{
	$fullname = $_POST['fullname'];
	$fullname = filter_var($fullname, FILTER_SANITIZE_STRING);
	$email = $_POST['email'];
	$email = filter_var($email, FILTER_SANITIZE_STRING);
	$password = $_POST['password'];
	$password = filter_var($password, FILTER_SANITIZE_STRING);
	$result = mysqli_query($con, "SELECT * FROM phonegap_login WHERE email = $email");
	$login = NULL;
	if ($result)
	{
		$login=mysqli_num_rows($result);
	}
	// else
	// {
	// 	$result = 0;
	// }
	
	if($login!=0)
	{
		echo "exist";
	}
	else
	{
		$date=date("d-m-y h:i:s");
		$q=mysqli_query($con, "INSERT INTO `phonegap_login` (`reg_date`,`fullname`,`email`,`password`) values ('$date','$fullname','$email','$password')");
		if($q)
		{
			echo "success";
		}
		else
		{
			echo "failed";
		}
	}
	echo mysqli_error($con);
}
?>