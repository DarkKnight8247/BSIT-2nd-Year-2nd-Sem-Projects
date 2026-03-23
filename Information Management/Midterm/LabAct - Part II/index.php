<?php include 'db.php'; ?>
<!DOCTYPE html>
<html>

<head>
    <title>Person Data Management</title>
</head>

<body>
    <h1>Person Records</h1>
    <a href="create.php">Add new record</a>
    <br><br>
    <table border="1" cellpadding="10">
        <tr>
            <th>ID</th>
            <th>Last Name</th>
            <th>Age</th>
            <th>Email</th>
            <th>Address</th>
            <th>Contact Number</th>
            <th>Job</th>
            <th>Actions</th>
        </tr>
        <?php
        $sql = "SELECT * FROM person_data";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<tr>
                    <td>" . $row["person_id"] . "</td>
                    <td>" . $row["lastname"] . "</td>
                    <td>" . $row["age"] . "</td>
                    <td>" . $row["email"] . "</td>
                    <td>" . $row["address"] . "</td>
                    <td>" . $row["contact_number"] . "</td>
                    <td>" . $row["job"] . "</td>
                    <td>
                        <a href='edit.php?id=" . $row["person_id"] . "'>Edit</a> | 
                        <a href='delete.php?id=" . $row["person_id"] . "' onclick='return confirm(\"Are you sure?\")'>Delete</a>
                    </td>
                </tr>";
            }
        } else {
            echo "<tr><td colspan='8'>No records found</td></tr>";
        }
        ?>
    </table>
</body>
</html>