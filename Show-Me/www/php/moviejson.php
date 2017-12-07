<?php
header("Access-Control-Allow-Origin: *");
 $con = mysqli_connect("db.sandbox.xellarant.com:3306","Xellarant","techn0pathy","babakari_movies") or die ("could not connect database");

$data=array();

if (isset($_GET["yearStart"]) 
    && strlen($_GET["yearStart"]) > 0) {
    $yearStart = $_GET["yearStart"];    
}
else {
    $yearStart = "1800/01/01";
}

if (isset($_GET["yearEnd"]) 
    && strlen($_GET["yearEnd"]) > 0) {
    $yearEnd = $_GET["yearEnd"];
}
else {
    $yearEnd = date('Y-m-d');
}

if (isset($_GET["movieTitle"])) {
    $movieTitle = $_GET["movieTitle"];
}
else {
    $movieTitle = null;
}

if (isset($_GET["movieDirector"])) {
    $movieDirector = $_GET["movieDirector"];
}
else {
    $movieDirector = null;
}

if (isset($_GET["movieActor"])) {
    $movieActor = $_GET["movieActor"];
}
else {
    $movieActor = null;
}

if (isset($_GET["movieGenre"])) {
    $movieGenre = $_GET["movieGenre"];
}
else {
    $movieGenre = null;
}

$q=mysqli_query($con,"CALL mdGetFullStats('$yearStart','$yearEnd','$movieTitle','$movieDirector','$movieActor', '$movieGenre');");
if ($q) {
    while ($row=mysqli_fetch_object($q)){
        $data[]=$row;
    }
}
else echo mysqli_error($con);

echo json_encode($data);
?>