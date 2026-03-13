<?php
$servername = "localhost";
$username = "root";
$password = "";

//
$conn = new mysqli($servername, $username, $password);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

//
$sql = "CREATE DATABASE IF NOT EXISTS classmates";
if ($conn->query($sql) === TRUE) {
    //
    $conn->select_db("classmates");

    //
    $table_sql = "CREATE TABLE IF NOT EXISTS classmates_details (
    stud_no int unsigned not null AUTO_INCREMENT PRIMARY KEY,
    lastname VARCHAR(100) NOT NULL,
    firstname VARCHAR(100) NOT NULL,
    sex VARCHAR(10),
    bdate DATE,
    age INT,
    religion VARCHAR(100),
    talent VARCHAR(255)
    )";
    $conn->query($table_sql);
}
else {
    die("ERROR creating database: " . $conn->error);
}
?>