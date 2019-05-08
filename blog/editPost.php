<?php
include "utilities/DB_Connection.php";

if(!empty($_POST))
{
    $errors = "";

    if($errors ==="") {
        $query=$pdo->prepare("UPDATE `Post`
            SET Authors_Id=:authorsId,
                Title=:title,
                Content=:content,
                CreactionDate=NOW()
            WHERE Id=:id");
        $updatePost=$query->execute(["id"=>$_POST["postId"],
            "authorsId"=>$_POST["authorsId"]==="0"?NULL:$_POST["authorsId"],
            "title"=>$_POST["title"],
            "content"=>$_POST["content"]
        ]);

        $query=$pdo->prepare("SELECT Categories_Id
                                        FROM Post_Categories
                                        WHERE Post_Id=:postId
                                        ");
        $query->execute(["postId"=>$_POST["postId"]]);
        $oldCats=$query->fetchAll(PDO::FETCH_COLUMN);

        if(!isset($_POST["Categories"])) {
            $newCat=[];
        }
        else {
            $newCat=$_POST["Categories"];
        }

        $removeCats=array_diff($oldCats,$newCat);
        $addCats=array_diff($newCat,$oldCats);

        $query=$pdo->prepare("DELETE FROM Post_Categories
                                        WHERE Post_Id=:postId AND Categories_Id=:CatId ");
        foreach  ($removeCats as $removeCat) {
            $query->execute(["postId"=>$_POST["postId"],
                                 "CatId"=>$removeCat
                                ]);

        }


        $query=$pdo->prepare("INSERT INTO Post_Categories(Post_Id,Categories_Id)
                                        VALUES (:post_Id,:categories)
                                         ");
        foreach  ($addCats as $cat) {
            $query->execute([
                                "post_Id"=>$_POST["postId"],
                                "categories"=>$cat
                            ]);

        }

        header('Location:admin.php#post-'.$_POST["postId"]);
        exit() ;

       // $template= "index.phtml";
    }
    else if($errors !==""){
        $template="errors.phtml";
    }




    // valider formulaire + update de l'article
}
else
{
    if( isset($_GET["id"]) && ctype_digit($_GET["id"]))
    {
        //créer le formulaire

        $query=$pdo->prepare("SELECT Post.Id, FirstName,LastName,CreactionDate,Content,Title, Authors_Id
                                FROM Post 
                                LEFT JOIN `Authors`
                                ON Post.Authors_Id=Authors.Id
                                WHERE Post.Id=:id");
        $query->execute(["id"=>$_GET["id"]]);
        $post=$query->fetch();



//
//        $query=$pdo->prepare("SELECT Id
//                                FROM `Post_Categories`
//                                INNER JOIN Categories
//                                ON Categories_Id = Categories.Id
//                                WHERE Post_Id=:id");
//        $query->execute(["id"=>$_GET["id"]]);
//        $postCategories = $query->fetchAll(PDO::FETCH_COLUMN);

        $query=$pdo->prepare("
                    SELECT Categories.Id, Name, (Post_Id IS NOT NULL) AS checked
            FROM `Categories`
            LEFT JOIN Post_Categories ON Categories.Id= Post_Categories.Categories_Id AND Post_Id=:id
            ORDER BY Name");
        $query->execute(["id"=>$_GET["id"]]);
        $postCategories=$query->fetchAll();

//        $query=$pdo->prepare(("SELECT Name, Id
//                           FROM Categories"));
//        $query->execute();
//        $allCategories=$query->fetchAll();


        $query=$pdo->prepare("SELECT FirstName,LastName ,Id
                                    FROM  Authors ");
        $query->execute();
        $allAuthors=$query->fetchAll();

        $template= "editPost.phtml";

    }
    else
    {
        //id invalide
        $errors .= "mauvaise id";
    }

}





include "layout.phtml";

