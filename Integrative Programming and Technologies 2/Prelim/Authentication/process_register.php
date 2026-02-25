<?php 

$jsonData = file_get_contents("users.json");
$data = json_decode($jsonData, true);

$newUser = $_POST['username'];
$newPassword = $_POST['password'];

foreach ($data['users'] as $user) {
    if ($user['username'] === $newUser) {
        die("Username already exists!");
    }
}

$data['users'][] = [
    'username' => $newUser,
    'password' => $newPassword
];

file_put_contents("users.json", json_encode($data, JSON_PRETTY_PRINT));

echo "Registered succesfully";
?>