<?php

session_start();
$userID = null;
if (isset($_SESSION["userID"]))
	$userID = $_SESSION["userID"];
if ($userID != null)
	echo $_SESSION["userID"];
else
	echo "failed";
?>