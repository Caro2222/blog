<?php
include "utilities/DB_Connection.php";
$query=$pdo->prepare("SELECT Id,CreactionDate,SUBSTR(Content,1,200) AS Content,Title
                                FROM Post
                                ORDER BY CreactionDate DESC");
$query->execute();
$posts=$query->fetchAll();




$template= "admin.phtml";
include "layout.phtml";