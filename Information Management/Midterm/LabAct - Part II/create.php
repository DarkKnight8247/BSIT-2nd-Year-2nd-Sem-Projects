<?php include 'db.php'; ?>
<!DOCTYPE html>
<html>

<body>
    <h2>Add New Person</h2>
    <form method="POST" action="">
        <table border="0">
            <tr>
                <td>Last Name:</td>
                <td><input type="text" name="lastname" required></td>
            </tr>
            <tr>
                <td>Age:</td>
                <td><input type="number" name="age" required></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="email" name="email" required></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><input type="text" name="address" required></td>
            </tr>
            <tr>
                <td>Contact Number:</td>
                <td><input type="text" name="contact_number" required></td>
            </tr>
            <tr>
                <td>Job:</td>
                <td><input type="text" name="job" required></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><button type="submit" name="save">Save Record</button></td>
            </tr>
        </table>
    </form>
    <br>
    <a href="index.php">Back to List</a>

    <?php
    if (isset($_POST['save'])) {
        $ln = $_POST['lastname'];
        $age = $_POST['age'];
        $email = $_POST['email'];
        $addr = $_POST['address'];
        $contact = $_POST['contact_number'];
        $job = $_POST['job'];

        $sql = "INSERT INTO person_data (lastname, age, email, address, contact_number, job)
                    VALUES ('$ln', '$age', '$email', '$addr', '$contact', '$job')";

        if ($conn->query($sql) === TRUE) {
            echo "<p>New record created successfully.</p>";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    }
    ?>
</body>
</html>