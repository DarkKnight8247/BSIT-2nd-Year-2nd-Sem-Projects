<?php
    session_start();

    $jsonData = file_get_contents("users.json");
    $data = json_decode($jsonData, true);

    $inputUser = $_POST['username'];
    $inputPassword = $_POST['password'];
    $valid = false;

    foreach ($data['users'] as $user) {
        if($user['username'] === $inputUser && $user['password'] === $inputPassword) {
            $valid = true;
            $_SESSION['username'] = $inputUser;
            break;
        }
    }

    if($valid){
        header("Location: dashboard.php");
    } else {
        echo "Invalid username and password!";
    }
?>