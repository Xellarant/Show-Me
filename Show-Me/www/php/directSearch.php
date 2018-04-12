<?php

include('scrape_imdb01.php');
	$yearStart = $_POST["yearStart"];
	if ($yearStart == "")
	    $yearStart = 0000;
	    
	$yearEnd = $_POST["yearEnd"];
	if ($yearEnd == "")
	    $yearEnd = 9999;

	$pageStart = $_POST["pageStart"];
	if ($pageStart == "")
	    $pageStart = 1;
	    
	$pageEnd = $_POST["pageEnd"];
	if ($pageEnd == "")
	    $pageEnd = 5;

    $title = $_POST["movieTitle"];

    $genres = $_POST["movieGenres"];
    
    $zip = $_POST["zipCode"];

    
//$data = scrape_imdb01($yearStart, $yearEnd, $pageStart, $pageEnd);
$data = scrape_imdb01($title, $genres);
    ////////
    //$images = array_values(array_unique($data[0][image]));
    //print_r($data);
    //print_r($data[0][image]);
?>
<div class="centered">
<a style="margin-bottom: 15px; margin-right: 45px; float: right; text-decoration: none;" href="http://sandbox.xellarant.com/index.html">Back to Home</a>
</div>
<?php
 
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
        echo "<a href='http://www.imdb.com/showtimes/title/tt$link/US/$zip?ref_=sh_ov_tt' target='_blank'>Show Time!!</a>";
        echo "<p style='background-color:LightBlue;'>$des</p>";
        echo "</div>";
    }
    die;
// Define server connection parameters
    $servername = "db.sandbox.xellarant.com";
    $username = "Xellarant";
    $password = "techn0pathy";
    $database = "babakari_movies";

// Create connection
	$mysqli = mysqli_connect($servername, $username, $password, $database);

// Check connection
	if (!$mysqli) {
		die("Connection failed: " . mysqli_connect_error());
	}
//	echo "Connected successfully";



for ($i = 0; $i < count($data); $i++ ) {
    
    $description = $mysqli->escape_string($data[$i]['description']);
    $title = $mysqli->escape_string($data[$i]['title']);
    
    $votes = intval($data[$i]['votes']);
    $gross = intval(str_replace(',','',$data[$i]['gross']));

    //insert movies
    $sql = "INSERT IGNORE INTO movies (title,year,image_url,certificate,runtime,
            imdb_rating,metascore,description,votes,gross)
            VALUES ('$title','{$data[$i]['year']}','{$data[$i]['image']}',
            '{$data[$i]['certificate']}','{$data[$i]['runtime']}','{$data[$i]['imdb_rating']}',
            '{$data[$i]['metascore']}','$description','$votes','$gross')";
            
    $mysqli->query($sql) or die($mysqli->error);
        
    $movies_id = $mysqli->insert_id; //get last key of the movie id, returns 0 if insert failed
    
    if ( !$movies_id ) { //duplicate movie
        continue; 
    }
        
    $directors = explode(",",$data[$i]['directors']);
    $stars = explode(",",$data[$i]['stars']);
    $genres = explode(",",$data[$i]['genres']);
    
    //insert directors
    for ($c = 0; $c < count($directors); $c++)
    {
        $director = $mysqli->escape_string(trim($directors[$c]));
        
        $sql = "INSERT IGNORE INTO directors (name) VALUES ('$director')";

        $mysqli->query($sql) or die($mysqli->error);
        $directors_id = $mysqli->insert_id;
        
        //if new director has been added, else if the director exists the id will be 0
        if ( $directors_id ){
            //insert movies_directors
            $sql = "INSERT INTO movies_directors (movies_id, directors_id) "
                    . "VALUES ('$movies_id','$directors_id')";
            $mysqli->query($sql);
        }
        else {
            //select director id by name
            $sql = "SELECT id FROM directors WHERE name='$director'";
            $result = $mysqli->query($sql) or die($mysqli->error);
            $row = $result->fetch_assoc();
            $directors_id = $row['id'];
            
            $sql = "INSERT INTO movies_directors (movies_id, directors_id) "
                . "VALUES ('$movies_id','$directors_id')";
            
            //if this fails, continue running, because the pair may already exist
            $mysqli->query($sql);  
        }
    }
    

    //insert stars
    for ($c = 0; $c < count($stars); $c++)
    {
        $star = $mysqli->escape_string(trim($stars[$c]));
        $sql = "INSERT IGNORE INTO stars (name) VALUES ('$star')";
        $mysqli->query($sql) or die($mysqli->error);
        $stars_id = $mysqli->insert_id;
        
        if ( $stars_id ){
            //insert movies_stars
            $sql = "INSERT INTO movies_stars (movies_id, stars_id) "
                    . "VALUES ('$movies_id','$stars_id')";
            $mysqli->query($sql);
        }
        else {
            $sql = "SELECT id FROM stars WHERE name='$star'";
            $result = $mysqli->query($sql) or die($mysqli->error);
            $row = $result->fetch_assoc();
            $stars_id = $row['id'];
            
            $sql = "INSERT INTO movies_stars (movies_id, stars_id) "
                . "VALUES ('$movies_id','$stars_id')";
            
            //if this fails, continue running, because the pair may already exist
            $mysqli->query($sql);
        }
    }
    
    //insert genres
    for ($c = 0; $c < count($genres); $c++)
    {
        $genre = $mysqli->escape_string(trim($genres[$c]));
        $sql = "INSERT IGNORE INTO genres (name) VALUES ('$genre')";
        $mysqli->query($sql) or die($mysqli->error);
        $genres_id = $mysqli->insert_id;
        
        if ( $genres_id ){
            //insert movies_genres
            $sql = "INSERT INTO movies_genres (movies_id, genres_id) "
                    . "VALUES ('$movies_id','$genres_id')"; 
            $mysqli->query($sql);
        }
        else {
            $sql = "SELECT id FROM genres WHERE name='$genre'";
            $result = $mysqli->query($sql) or die($mysqli->error);
            $row = $result->fetch_assoc();
            $genres_id = $row['id'];
            
            $sql = "INSERT INTO movies_genres (movies_id, genres_id) "
                . "VALUES ('$movies_id','$genres_id')";
            
            //if this fails, continue running, because the pair may already exist
            $mysqli->query($sql);    
        }
    }
}
echo "update successfully is done";
  		echo "<script>window.location.replace('http://showme-fav.com/update.html');</script>";
?>
