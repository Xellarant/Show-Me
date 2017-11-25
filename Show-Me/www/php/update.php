<?php
 include "db.php";
 if(isset($_POST['update']))
 {
 $id=$_POST['id'];
 $title=$_POST['title'];
 $genre=$_POST['genre'];
 $subgenre=$_POST['subgenre'];
 $q=mysqli_query($con,"UPDATE `user_favorites` SET `title`='$title',`genre`='$genre',`subgenre`='$subgenre' where `id`='$id'");
 if($q)
 echo "success";
 else
 echo "error";
 }
 ?>