<?php
    
    session_start();
    if($_SESSION["loggedIn"] !== true){
        header("Location: /admin/login.php");
        exit();
    }

    require($_SERVER["DOCUMENT_ROOT"]."/database/ingredients.php");
    $ingredientsFactory = new Ingredients();
    $ingredients = $ingredientsFactory->findAll();
?>

<!DOCTYPE html>
<html lang="de">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
</head>

<body>
    <?php
        include($_SERVER["DOCUMENT_ROOT"]."/includes/header-admin.php");
    ?>
    <main role="main">

        <section class="jumbotron text-center">
            <div class="container">
                <h1>Administration</h1>
                <h2>Zutaten</h2>
            </div>
        </section>
        <div class="py-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                    <ul class="list-group">
                        <form action="/admin/ingredients.php" method="post">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                <input class="form-control"  type="text" name="new-ingredient" id="new-ingredient" placeholder="Neue Zutat">
                                <button class="ml-3 btn btn-secondary" type="submit"><i class="far fa-save"></i></button>
                            </li>
                        </form>
                        
                        <?php
                            foreach ($ingredients as $key => $i) {
                                echo '<li class="list-group-item d-flex justify-content-between align-items-center" data-id="'.$i->getId().'">'
                                        .$i->getTitle().
                                        '<button class="btn btn-danger" type="submit"><i class="far fa-trash-alt"></i></button>
                                    </li>';
                            }
                        ?>
                    </ul>
                    </div>
                </div>
            </div>
        </div>

    </main>
    <?php
        include($_SERVER["DOCUMENT_ROOT"]."/includes/footer.php");
    ?>
</body>

</html>