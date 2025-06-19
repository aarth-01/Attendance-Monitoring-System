<?php 
error_reporting(0);
include '../Includes/dbcon.php';
include '../Includes/session.php';

// Set headers for Excel download
$filename = "Attendance_list_" . date("Y-m-d") . ".xls";
header("Content-type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename=\"$filename\"");
header("Pragma: no-cache");
header("Expires: 0");

$dateTaken = date("Y-m-d");

echo '<table border="1">
<thead>
    <tr>
        <th>#</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Admission No</th>
        <th>Class</th>
        <th>Class Div</th>
        <th>Session</th>
        <th>Term</th>
        <th>Status</th>
        <th>Date</th>
    </tr>
</thead>
<tbody>';

$cnt = 1;			
$ret = mysqli_query($conn, "SELECT attendance.Id, attendance.status, attendance.dateTimeTaken, class.className,
        classDiv.classDivName, sessionterm.sessionName, sessionterm.termId, term.termName,
        students.firstName, students.lastName, students.admissionNumber
        FROM attendance
        INNER JOIN class ON class.Id = attendance.classId
        INNER JOIN classDiv ON classDiv.Id = attendance.classDivId
        INNER JOIN sessionterm ON sessionterm.Id = attendance.sessionTermId
        INNER JOIN term ON term.Id = sessionterm.termId
        INNER JOIN students ON students.admissionNumber = attendance.admissionNo
        WHERE attendance.dateTimeTaken = '$dateTaken' AND attendance.classId = '$_SESSION[classId]' AND attendance.classDivId = '$_SESSION[classDivId]'");

if (mysqli_num_rows($ret) > 0) {
    while ($row = mysqli_fetch_array($ret)) { 
        $status = ($row['status'] == '1') ? "Present" : "Absent";
        $colour = ($row['status'] == '1') ? "#00FF00" : "#FF0000";

        echo '<tr>  
            <td>' . $cnt . '</td> 
            <td>' . $row['firstName'] . '</td> 
            <td>' . $row['lastName'] . '</td> 
            <td>' . $row['admissionNumber'] . '</td> 
            <td>' . $row['className'] . '</td> 
            <td>' . $row['classDivName'] . '</td>	
            <td>' . $row['sessionName'] . '</td>	 
            <td>' . $row['termName'] . '</td>	
            <td>' . $status . '</td>	 	
            <td>' . $row['dateTimeTaken'] . '</td>	 					
        </tr>';
        $cnt++;
    }
} else {
    echo '<tr><td colspan="10">No records found.</td></tr>';
}

echo '</tbody></table>';
?>