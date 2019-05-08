<?php
include "utilities/DB_Connection.php";
if(!empty($_POST)) {
    //verifier les données
    //authorsId est-il un entier ?
    $errors = "";

    if (!ctype_digit($_POST["authorsId"])) {

            $errors .= "Auteur incorrect <br>";

    }

    if (isset($_POST["categories"])) {
        foreach ($_POST["categories"] as $categoryId) {

            if (!ctype_digit($categoryId)) {
                $errors .= "Catégories incorect <br>";
            }
        }
    }
    //titre est-il vide?


    if (!isset($_POST['title']) || (trim($_POST["title"])) == "")
    {
        $errors .= "Veuillez entrer un titre <br>";

    }
    //contenu est-il vide ?
    if (!isset($_POST['content']) || (trim($_POST["content"])) == "")
    {

            $errors .= "Veuillez entrer du contenu <br>";

    }

    //ecrire dans la base
    if($errors== "")
    {
        //S'il n'y a pas d'erreurs
        $query=$pdo->prepare("INSERT INTO Post 
                                        (Authors_Id,Title,Content,CreactionDate) 
                                        VALUES  (:authorsId, :title, :content,NOW())");
        $query->execute([
            "authorsId"=>$_POST["authorsId"]==="0"?NULL:$_POST["authorsId"],
            "title"=>$_POST["title"],
            "content"=>$_POST["content"]

        ]);

        $query=$pdo->prepare("INSERT INTO Post_Categories
                                        (Post_Id,Categories_id)
                                        VALUES (:post_Id,:categories)");

        if(isset($_POST["categories"])) {
            $postId=$pdo->lastInsertId();
        }


        foreach ( $_POST["categories"] as $categoryId)
        {
            $query->execute([
                "post_Id"=>$postId,
                "categories"=>$categoryId

            ]);
        }
        header('Location:index.php');
        exit() ;

    }
    else{
//        S'il y a des erreurs
        $template="errors.phtml";
    }


}
else
{
    // recuperer id prenom ,nom des auteurs dans un tableau $allAuthors
    $query=$pdo->prepare("SELECT FirstName,LastName ,Id
                                FROM  Authors ");
    $query->execute();
    $allAuthors=$query->fetchAll();

//recuperer toutes les categories dans un tableau $allCategories
    $query=$pdo->prepare(("SELECT Name,Id 
                        FROM Categories"));
    $query->execute();
    $allCategories=$query->fetchAll();


     $template="addPost.phtml";
}
include "layout.phtml";





