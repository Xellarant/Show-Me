<html>
<body>
	<?php
/////////////////////////////////////////////////////////////
// Define server connection parameters
	$servername = "localhost";
	$username = "babakari_showMe";
	$password = "password";
	$dbName = "users";

// Create connection
	$conn = mysqli_connect($servername, $username, $password);

// Check connection
	if (!$conn) {
		die("Connection failed: " . mysqli_connect_error());
	}
	echo "Connected successfully";
/////////////////////////////////////////////////////////////

// redefine variables and set to empty values
	$username = $password = "";

	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		$username = test_input($_POST["username"]);
		$password = test_input($_POST["password"]);		
	}

	function test_input($data) {
		$data = trim($data);
		$data = stripslashes($data);
		$data = htmlspecialchars($data);
		return $data;
	}

	$sql = "SELECT 1 FROM users WHERE username = $username AND password = $password"
	$result = $conn->query($sql);
	if ($result->num_rows == 1) {
    // login successful

	} else {
		echo "0 results";
	}
	?>
</body>
</html>