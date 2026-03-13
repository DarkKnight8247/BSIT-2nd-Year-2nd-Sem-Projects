<?php include 'db.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Classmates CRUD App</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>Classmates CRUD App</h1>
        <p style="text-align: center;">Database Connection Status: <b style="color: green">Connected successfull.</b></p>

        <h2 style="margin-top: 40px;">Features</h2>
        <div class="actions">
            <a href="create.php" class="btn">Create (Add new classmates)</a>
            <a href="read.php" class="btn">Read (View, Filter, and Sort classmates)</a>
        </div>
    </div>
</body>
</html>
