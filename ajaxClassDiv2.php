<?php

include '../Includes/dbcon.php';

    $cid = intval($_GET['cid']);//

        $queryss=mysqli_query($conn,"select * from classDiv where classId=".$cid."");                        
        $countt = mysqli_num_rows($queryss);

        echo '
        <select required name="classDivId" class="form-control mb-3">';
        echo'<option value="">--Select Class Div--</option>';
        while ($row = mysqli_fetch_array($queryss)) {
        echo'<option value="'.$row['Id'].'" >'.$row['classDivName'].'</option>';
        }
        echo '</select>';
?>

