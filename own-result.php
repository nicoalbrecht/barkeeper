<?php
    require($_SERVER["DOCUMENT_ROOT"].'/database/models/cocktail.php');
    $cocktail = new Cocktail();
    $cocktail->setTitle($_POST["title-input"]);
    $cocktail->setDescription($_POST["description-input"]);
    $cocktail->setPreparation($_POST["recipe-input"]);
    foreach($_POST as $field => $value) {
        if(strpos($field, "ingredient-select-") !== false) {
            $iId = trim($field, 'ingredient-select-');
            $cocktail->addIngredient($value, $_POST['ingredient-amount-'.$iId]);
        }
    }
    $cocktail->save();
?>
<!DOCTYPE html>
<html lang="de">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="/assets/css/styles.css">
</head>

<body>
    <?php
        include($_SERVER["DOCUMENT_ROOT"]."/includes/header.php");
    ?>
    <main role="main">

        <div class="py-5">
            <div class="container">
                <?php
                    if($cocktail->getId()) {
                        echo '<div class="alert alert-success" role="alert">
                        Dein Cocktail "' . $cocktail->getTitle() . '" wurde erfolgreich zu unserer Sammlung hinzugefügt!
                      </div>';
                    }
                ?>
            </div>
        </div>

    </main>
    <?php
        include($_SERVER["DOCUMENT_ROOT"]."/includes/footer.php");
    ?>
    <script src="/assets/js/bootstrap-select.min.js"></script>
</body>

</html>