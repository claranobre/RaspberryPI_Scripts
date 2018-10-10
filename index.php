<?php
    $error = "";
    if(isset($_POST['username'],$_POST['password'])){

        /*** You can change username & password ***/
        $user = array(
                        "user" => "0",
                        "pass"=>"0"
                );
        $username = $_POST['username'];
        $pass = $_POST['password'];
        if($username == $user['user'] && $pass == $user['pass']){
            session_start();
            $_SESSION['simple_login'] = $username;
            header("Location: index-prte.php");
            exit();
        }else{
            $error = '<div class="alert alert-danger">Usuario ou senha invalidos</div>';
        }
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>NOC_PRTE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Include stylesheet for better appearance of login form -->

    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        body{
                padding-top:20px;
                background-color: black;
        }

    </style>
</head>
<body>
    <div class="container">
        <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Faça seu login</h3>
                </div>
                <div class="panel-body">
                    <?php echo $error; ?>
                    <form accept-charset="UTF-8" role="form" method="post" action="index.php">
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" placeholder="Usuario" name="username" type="text">
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Senha" name="password" type="password" value="">
                            </div>
                                <input class="btn btn-lg btn-success btn-block" type="submit" value="Login">
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
        </div>
    </div>
</body>
</html>
