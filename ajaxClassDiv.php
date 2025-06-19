

<?php
include '../Includes/dbcon.php';
    $cid = $_GET['cid'];

        $query = "SELECT * FROM classDiv WHERE classId = '$cid'";

        // Execute query and retrieve data
        $result = $conn->query($query);

        // Create HTML select options
        $options = '';
        while ($row = $result->fetch_assoc()) {
            $options .= '<option value="' . $row['Id'] . '">' . $row['classDivName'] . '</option>';
        }

        // Output HTML select options
        echo '<select name="classDivId" class="form-control">' . $options . '</select>';
?>