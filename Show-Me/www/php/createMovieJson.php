<?php
header("Access-Control-Allow-Origin: *");

$data=array();
$myfile = fopen("../json/movie_data.json", "w") or die("Unable to open file!");

$con = mysqli_connect("localhost:3306","root","","babakari_movies") or die ("could not connect database");
 
$q=mysqli_query($con,"CALL mdGetFullStats(null,null,null,null,null,null);");

if ($q) {
    while ($row=mysqli_fetch_array($q)){
    	echo json_encode($row);
        fwrite($myfile, json_encode($row));
    }
}

fclose($myfile);
$con->close();
?>