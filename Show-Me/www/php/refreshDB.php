<?php
include "db.php";

echo "test.";
/*

MAILTO="xellarant@gmail.com"
1 0 * * * php /var/www/html/php/refreshDB.php

*/

// tmdb key
$api_key = 'e945ada112a9c51dd4bd56452b468c93';
$image_source = 'https://image.tmdb.org/t/p/w500';	// curent prefix to any image URL from tmdb.


for ($page_count = 1; $page_count <= 1000; $page_count++)
{
	echo "<br/>grabbing page $page_count.<br/>";
	$curl = curl_init();

	// call tmdb API to get 'Now Playing' list for each page.
	curl_setopt_array($curl, array(
	  CURLOPT_URL => "https://api.themoviedb.org/3/movie/now_playing?page=$page_count&language=en-US&api_key=$api_key",
	  CURLOPT_RETURNTRANSFER => true,
	  CURLOPT_ENCODING => "",
	  CURLOPT_MAXREDIRS => 10,
	  CURLOPT_TIMEOUT => 30,
	  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
	  CURLOPT_CUSTOMREQUEST => "GET",
	  CURLOPT_POSTFIELDS => "{}",
	));

	$response = curl_exec($curl);
	$err = curl_error($curl);

	curl_close($curl);

	if ($err) {
	  echo "cURL Error #:" . $err;
	} 
	else { 								//successfully got results! let's process it.
		echo "<br/>connections successful. printing response(s).<br/>";
		echo "<script>console.log($response.results)</script>";
		$responseObject = json_decode($response);		
		
		//var_dump($results);	// for debugging.
		if (count($responseObject->results) < 1) {
			break;	// exit for loop if pages no longer contain results.
		}

		foreach($responseObject->results as $value) {
			
			$currentTitle = $value->title; // just an alias for convenience.
			
			if ($value->adult) {	// stringify the boolean values so it's easier to print and/or insert them.
				$value->adult = 'true';
			}
			else {
				$value->adult = 'false';
			}
			
			// check if we already have this result stored or not.
			$stmt1 = $con->prepare("SELECT	tmdbMovieID	FROM	babakari_showme.tmdb_movies	WHERE	tmdbMovieID = $value->id;");
			$stmt1->execute();
			$stmt1->store_result();
			$stmt1->bind_result($tmdbMovieID);
			$stmt1->fetch();

			$movieCheck=$stmt1->num_rows;

			if($movieCheck > 0) {
				echo "$currentTitle was not added (for it is already in the database)."."<br/>";
			}
			else {

				// Sanitize strings to prepare them for SQL inserts.

				$value->title = str_replace("'", "''", $value->title);
				$value->poster_path = str_replace("'", "''", $value->poster_path);
				$value->original_language = str_replace("'", "''", $value->original_language);
				$value->original_title = str_replace("'", "''", $value->original_title);
				$value->backdrop_path = str_replace("'", "''", $value->backdrop_path);
				$value->overview = str_replace("'", "''", $value->overview);


				// debug block (feel free to delete.)

				// echo "<script>";
				// echo "console.log('value->id: ' + $value->id);";
				// echo "console.log('value->vote_count: ' + $value->vote_count);";
				// echo "console.log('value->vote_average: ' + $value->vote_average);";
				// echo "console.log('value->title: ' + '$value->title');";
				// echo "console.log('value->popularity: ' + $value->popularity);";
				// echo "console.log('value->poster_path: ' + '$value->poster_path');";
				// echo "console.log('value->original_language: ' + '$value->original_language');";
				// echo "console.log('value->original_title: ' + '$value->original_title');";
				// echo "console.log('value->backdrop_path: ' + '$value->backdrop_path');";
				// echo "console.log('value->adult: ' + '$value->adult');";						
				// echo "console.log(`value->overview: $value->overview`);";
				// echo "console.log('value->release_date: ' + '$value->release_date');";
				// echo "</script>";


				$stmt2 = $con->prepare("INSERT INTO babakari_showme.tmdb_movies (tmdbMovieID, vote_count, vote_average, title, popularity, poster_path, original_language, original_title, backdrop_path, isAdult, overview, release_date)	VALUES ($value->id, $value->vote_count, $value->vote_average, '$value->title', $value->popularity, '$image_source$value->poster_path', '$value->original_language', '$value->original_title', '$image_source$value->backdrop_path', $value->adult, '$value->overview', '$value->release_date');"); // end SQL statement

				$stmt2->execute();
				$stmt2->store_result();
				//$stmt2->bind_result();
				// $stmt->fetch();

				echo "$currentTitle was inserted into the database!"."<br/>";

			} // end dupCheck else
			
			// movie was either inserted or was already in the database.
			// let's get fancy and add an imdb id.

			$curl = curl_init();

			curl_setopt_array($curl, array(
			  CURLOPT_URL => "https://api.themoviedb.org/3/movie/$value->id/external_ids?api_key=$api_key",
			  CURLOPT_RETURNTRANSFER => true,
			  CURLOPT_ENCODING => "",
			  CURLOPT_MAXREDIRS => 10,
			  CURLOPT_TIMEOUT => 30,
			  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			  CURLOPT_CUSTOMREQUEST => "GET",
			  CURLOPT_POSTFIELDS => "{}",
			));

			$response = curl_exec($curl);
			$err = curl_error($curl);

			curl_close($curl);

			if ($err) {
			  echo "cURL Error #:" . $err;
			} else {
				$responseObject2 = json_decode($response);
				$imdb_id = substr($responseObject2->imdb_id, 2);
			  	echo "imdb id for $currentTitle: $imdb_id<br/>";

			  	$stmt3 = $con->prepare("SELECT	imdb_id
										FROM	tmdb_movies
										WHERE	tmdbMovieID = $value->id
										AND	imdb_id IS NOT NULL;");
				$stmt3->execute();
				$stmt3->store_result();
				$stmt3->bind_result($prevID);
				$stmt3->fetch();

				$idCheck=$stmt3->num_rows;

				if ($idCheck < 1) {
					$update = mysqli_query($con, "UPDATE	babakari_showme.tmdb_movies SET		imdb_id = $imdb_id WHERE	tmdbMovieID = $value->id");	
					if ($update) // if the update query was successful...
					{
						echo "imdb id updated to $imdb_id for $currentTitle.<br/><br/>";
					}
					else {
						echo "there was an error updating the imdb id for $currentTitle!<br/><br/>";
					}
				}
				else {
					echo "imdb id for $currentTitle already in the database!<br/><br/>";
				}
			}

		} // end foreach
	} // end cURL else.
} // end page_counter for.

echo mysqli_error($con);

?>