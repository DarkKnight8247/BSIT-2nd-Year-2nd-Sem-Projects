<?php include 'db.php';
$id = $_GET['id'];
$result = $conn->query("SELECT * FROM person_data WHERE person_id = $id");
$row = $result->fetch_assoc();
?>
<!DOCTYPE html>
<html>

<body>
    <h2>Edit Person Record</h2>
    <form method="POST" action="">
        <table border="0">
            <tr>
                <td>Last Name:</td>
                <td><input type="text" name="lastname" value="<?php echo $row['lastname']; ?>" required></td>
            </tr>
            <tr>
                <td>Age:</td>
                <td><input type="number" name="age" value="<?php echo $row['age']; ?>" required></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="email" name="email" value="<?php echo $row['email']; ?>" required></td>
            </tr>
            <tr>
                <td>Address:</td>
                <td><input type="text" name="address" value="<?php echo $row['address']; ?>" required></td>
            </tr>
            <tr>
                <td>Contact Number:</td>
                <td><input type="text" name="contact_number" value="<?php echo $row['contact_number']; ?>" required>
                </td>
            </tr>
            <tr>
                <td>Job:</td>
                <td><input type="text" name="job" value="<?php echo $row['job']; ?>" required></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><button type="submit" name="update">Update Record</button></td>
            </tr>
        </table>
    </form>
    <br>
    <a href="index.php">Cancel</a>

    <?php
    if (isset($_POST['update'])) {
        $ln = $_POST['lastname'];
        $age = $_POST['age'];
        $email = $_POST['email'];
        $addr = $_POST['address'];
        $contact = $_POST['contact_number'];
        $job = $_POST['job'];

        $sql = "UPDATE person_data SET lastname='$ln', age='$age', email='$email', 
                    address='$addr', contact_number='$contact', job='$job' WHERE person_id=$id";

        if ($conn->query($sql) === TRUE) {
            header("Location: index.php");
        } else {
            echo "Error updating record: " . $conn->error;
        }
    }
    ?>
</body>
</html>