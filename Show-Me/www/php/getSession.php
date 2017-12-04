<?php
session_start();
if (!empty($_SESSION))
{
	if (isset($_GET['requested'])) {
		echo $_SESSION[$_GET['requested']];
	}
	else
		echo json_encode($_SESSION);	
}
else
	echo "failed";

?>