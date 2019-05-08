<?php
include "utilities/DB_connection.php";

$errors ="";

if (empty($_GET))
{
   if (!isset($_GET["id"])|| !ctype_digit($_GET["id"]))
   {
       $errors.="L'article n'existe pas";
   }
   else
   {
       $template="error.phtml";
   }
}
else
 {

    $id = $_GET["id"];
    $query=$pdo->prepare("SELECT Post.Id, FirstName,LastName,CreactionDate,Content,Title
                                FROM `Post`
                                LEFT JOIN Authors
                                ON Post.Authors_Id=Authors.Id
                                WHERE Post.Id=:id");
    $query->execute(["id"=>$_GET["id"]]);
    $post=$query->fetch();

    $query=$pdo->prepare("SELECT Name
    FROM `Post_Categories`
    INNER JOIN Categories
    ON Categories_Id = Categories.Id
    WHERE Post_Id=:id");
$query->execute(["id"=>$_GET["id"]]);
$categories = $query->fetchAll();



$query=$pdo->prepare("SELECT NickName,Comments,CreactionDate
        FROM comments
        WHERE Post_Id = :id
     ORDER BY CreactionDate DESC ");
$query->execute(["id"=>$_GET["id"]]);
$comments=$query->fetchAll();


    $template= "show.phtml";
}

  


include "layout.phtml";