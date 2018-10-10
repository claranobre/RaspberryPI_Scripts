<!-- painel.php -->
<?php
    session_start();
    if(!isset($_SESSION['simple_login'])){
        header("Location: index.php");
        exit();
    }
?>
