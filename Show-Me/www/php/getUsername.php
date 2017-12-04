<?php

session_start();
$username = null;
if (isset($_SESSION["username"]))
	$username = $_SESSION["username"];
if ($username != null)
	echo $_SESSION["username"];
else
	echo "failed";
?>