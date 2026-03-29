<?php
session_start();

$jsonData = file_get_contents("users.json");
$data = json_decode($jsonData, true);

$inputOTP = $_POST['otp'];
$username = $_SESSION['temp_user'];
$role = $_SESSION['temp_role'];

//verification process

foreach ($data['user'] as $user){
    if($user['username'] === $username) {
        if(time() > $user['otp_expiry']) {
            die("OTP already expired!");
        }

        if($user['otp'] == $inputOTP){
            $_SESSION['username'] = $username;
            $_SESSION['role'] = $role;
            unset($_SESSION['temp_user']);
            unset($_SESSION['temp_role']);

            header("Location: dashboard.php");
            exit();
        } else {
            echo "OTP is invalid";
        }

    }
}
?>