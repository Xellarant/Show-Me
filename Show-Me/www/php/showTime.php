<?php

include('scrape_showTime.php');
//include('scrape_imdb01.php');
////////////
    header("Access-Control-Allow-Origin: *");
    
    
    if (isset($_GET["yearStart"])
        && strlen($_GET["yearStart"]) > 0) {
        $startYear = $_GET["yearStart"];
        $endYear = $_GET["yearStart"];
    }
    else {
        $startYear = "";
        $endYear = "";
    }
    
    
    if (isset($_GET["movieTitle"])) {
        $movieTitle = $_GET["movieTitle"];
    }
    else {
        $movieTitle = null;
    }
    
    if (isset($_GET["movieRate"])) {
        $mRate = $_GET["movieRate"];
    }
    else {
        $mRate = "0";
    }
    

    
    if (isset($_GET["movieGenre"])) {
        $movieGenre = $_GET["movieGenre"];
    }
    else {
        $movieGenre = null;
    }
    
    
    
///////////

$data = scrape_showTime($movieTitle, $movieGenre, $startYear, $endYear, $mRate);
//$data =  scrape_imdb01($movieTitle, $movieGenre);
echo json_encode($data);

/*
    for ($i = 0; $i < count ($data); $i++) {
        $img = $data[$i][image];
        $titleMovie = $data[$i][title];
        $des = $data[$i][description];
        $year = $data[$i][year];
        $mGenres = $data[$i][genres];
        $dir = $data[$i][directors];
        $stars = $data[$i][stars];
        $link = $data[$i][id];
        echo "<div style='float: left; margin: 10 10 10 10; width:320px;height:360px;'>";
        echo "<img src='$img' style='width:120px;height:160px;'><br />";
        echo "<h3 style='background-color:gray;'>$titleMovie</h3>";
        echo "<p>year: $year  | genres: $mGenres  </p>";
        echo "<a href='http://www.imdb.com/showtimes/title/$link/US/$zip?ref_=sh_ov_tt' target='_blank'>Show Time!!</a>";
        echo "<p style='background-color:LightBlue;'>$des</p>";
        echo "</div>";
    }
    die;
*/
    
    
    
//echo "update successfully is done";
//echo "<script>window.location.replace('http://showme-fav.com/update.html');</script>";
?>



