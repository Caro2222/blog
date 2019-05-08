<?php
include "utilities/DB_connection.php";
$errors ="";
if (!empty ($_POST))
{

    if(!isset($_POST["NickName"])||trim($_POST["NickName"])=="")
    {



        $errors.="Entrer votre nom<br>";
    }

    if(!isset($_POST["Comments"])||trim($_POST["Comments"])=="")
    {

        $errors.="Entrer votre commentaire ";

    }

    if($errors!=="")
    {
        $template="errors.phtml";
        include "layout.phtml";

    }

    if ($errors =="")
    {
        $query=$pdo->prepare(" INSERT INTO Comments 
                                        (NickName,Comments,CreactionDate,Post_Id)
                                        VALUES  (:NickName, :Comments,NOW(),:postId)");
        $query->execute([
            "NickName"=>$_POST["NickName"],
            "Comments"=>$_POST["Comments"],
            "postId"=>$_POST["postId"]

        ]);

        header("Location:show.php?id=".$_POST["postId"]);
    }



}

