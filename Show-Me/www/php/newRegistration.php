
<?php
include"db.php";
/////////////////////////////////////////////////////////////

// redefine variables and set to empty values

try {
	$username = $pass = "";	
	$username = $_POST["username"];
	$pass = $_POST["password"];
	$firstname = $_POST["firstname"];
	$lastname = $_POST["lastname"];
	$email = $_POST["email"];	
} catch (Exception $e) {
	echo "Failure. Post variables likely not set properly.";
}
    
//echo "test2";
$con->select_db("babakari_showMe");

try {
	$stmt = $con->prepare("CALL newUserReg (?, ?, ?, ?, ?);");
	$pwH = hash('sha512', $pass);
	$stmt->bind_param("sssss", $username, $pwH, $firstname, $lastname, $email);
}
catch (Exception $e) {

}
// variable report for debug only
// echo "<br>user: " + $user;
// echo "<br>psH: " + $pwH;
// echo "<br>First Name: " + $firstName;
// echo "<br>Last Name: " + $lastName;
// echo "<br>Email: " + $email;
//////////////////////////////////
$result = $stmt->execute();

/* bind result variables */
$stmt->bind_result($userID, $username, $firstname, $lastname, $email);
/* fetch value */
$stmt->fetch();

if ($userID != 0)
{
	session_start();
	$_SESSION['valid'] = true;
	$_SESSION['timeout'] = time();
	$_SESSION['userID'] = $userID;
	$_SESSION['username'] = $username;
	$_SESSION['firstname'] = $firstname;
	$_SESSION['lastname'] = $lastname;
	$_SESSION['email'] = $email;
	
    echo "success";
}
else
{
	$errorMsg = array();
    $errorMsg['valid'] = false;
    $errorMsg['msg'] = mysqli_error($con);
    echo json_encode($errorMsg);
}
$stmt->close();
	
?>