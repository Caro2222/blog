<?php
include "utilities/DB_Connection.php";


if(!empty($_GET["id"])) {
    $query = $pdo->prepare("DELETE FROM Post
                                      WHERE Id = :postId  ");

    $query->execute(["postId"=>$_GET["id"]]);
}

header('Location:admin.php');
exit() ;