let zipCode = prompt("Please enter your zip code.");
import MovieFone from 'moviefone';
 
let moviefone = new MovieFone(zipCode, null);
 
moviefone.getNewReleases().then(response =>{ console.log(response); })
.catch(err => { console.log(err); });