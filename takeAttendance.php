<?php 
error_reporting(0);
include '../Includes/dbcon.php';
include '../Includes/session.php';

$query = "SELECT class.className,classDiv.classDivName 
FROM classteacher
INNER JOIN class ON class.Id = classteacher.classId
INNER JOIN classDiv ON classDiv.Id = classteacher.classDivId
INNER JOIN students ON students.classDivID = classteacher.classDivId
Where classteacher.Id = '$_SESSION[userId]'";
$rs = $conn->query($query);
$num = $rs->num_rows;
$rrw = $rs->fetch_assoc();

//session and Term
$querey=mysqli_query($conn,"select * from sessionterm where isActive ='1'");
$rwws=mysqli_fetch_array($querey);
$sessionTermId = $rwws['Id'];

$statusMsg = ""; // Initialize status message

if (isset($_POST['save'])) {
    // Check if the attendance date is provided
    if (empty($_POST['attendanceDate'])) {
        $statusMsg = "<div class='alert alert-danger' style='margin-right:700px;'>Attendance date is required!</div>";
    } else {
        $dateTaken = $_POST['attendanceDate'];
        echo "Attendance Date: " . $dateTaken; // This will display the date on the page

        $qurty=mysqli_query($conn,"select * from attendance where classId = '$_SESSION[classId]' and classDivId = '$_SESSION[classDivId]' and dateTimeTaken='$dateTaken'");
        $count = mysqli_num_rows($qurty);

        if($count == 0){ //if Record does not exist, insert the new record
            //insert the students record into the attendance table on page load
            $qus=mysqli_query($conn,"select * from students where classId = '$_SESSION[classId]' and classDivId = '$_SESSION[classDivId]'");
            while ($ros = $qus->fetch_assoc()) {
                $qquery=mysqli_query($conn,"insert into attendance(admissionNo,classId,classDivId,sessionTermId,status,dateTimeTaken) 
                value('$ros[admissionNumber]','$_SESSION[classId]','$_SESSION[classDivId]','$sessionTermId','0','$dateTaken')");
            } 
        }

        // Check if attendance has already been taken
        $qurty=mysqli_query($conn,"select * from attendance where classId = '$_SESSION[classId]' and classDivId = '$_SESSION[classDivId]' and dateTimeTaken='$dateTaken' and status = '1'");
        $count = mysqli_num_rows($qurty);

        if($count > 0){
            $statusMsg = "<div class='alert alert-danger' style='margin-right:700px;'>Attendance has been taken for today!</div>";
        } else { // Update the status to 1 for the checked checkboxes
            $admissionNo=$_POST['admissionNo'];
            $check=$_POST['check'];
            $N = count($admissionNo);
            for($i = 0; $i < $N; $i++) {
                if(isset($check[$i])) { // the checked checkboxes
                    $admissionNumber = $admissionNo[$i];
                    $query = "UPDATE attendance SET status = '1' WHERE admissionNo = '$admissionNumber' AND classId = '$_SESSION[classId]' AND classDivId = '$_SESSION[classDivId]' AND dateTimeTaken = '$dateTaken'";
                    $result = mysqli_query($conn, $query);
                    if (!$result) {
                        $statusMsg = "<div class='alert alert-danger' style='margin-right:700px;'>Error: " . mysqli_error($conn) . "</div>";
                    } else {
                        $statusMsg = "<div class='alert alert-success' style='margin-right:700px;'>Attendance Taken Successfully!</div>";
                    }
                }
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link href="img/logo/attnlg.jpg" rel="icon">
  <title>Dashboard</title>
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="css/ruang-admin.min.css" rel="stylesheet">



   <script>
    function classDivDropdown(str) {
    if (str == "") {
        document.getElementById("txtHint").innerHTML = "";
        return;
    } else { 
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {
            // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("txtHint").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("GET","ajaxClassDiv2.php?cid="+str,true);
        xmlhttp.send();
    }
}
</script>
</head>

<body id="page-top">
  <div id="wrapper">
    <!-- Sidebar -->
      <?php include "Includes/sidebar.php";?>
    <!-- Sidebar -->
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
        <!-- TopBar -->
       <?php include "Includes/topbar.php";?>
        <!-- Topbar -->

        <!-- Container Fluid-->
        <div class="container-fluid" id="container-wrapper">
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Take Attendance </h1>
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="./">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">All Student in Class</li>
            </ol>
          </div>

          <div class="row">
            <div class="col-lg-12">
              <!-- Form Basic -->


              <!-- Input Group -->
        <form method="post">
            <div class="row">
              <div class="col-lg-12">
              <div class="card mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">All Student in (<?php echo $rrw['className'].' - '.$rrw['classDivName'];?>) Class</h6>
                  <h6 class="m-0 font-weight-bold text-danger"></i></h6>
                </div>
                <div class="table-responsive p-3">
                <?php echo $statusMsg; ?>
                <label for="attendanceDate">Attendance Date:</label>
                 <input type="date" id="attendanceDate" name="attendanceDate" required>
              
                  <table class="table align-items-center table-flush table-hover">
                    <thead class="thead-light">
                      <tr>
                        <th>#</th>
                        <th>First Name</th>
                        <th>last Name</th>
                        <th>Admission No</th>
                        <th>Class</th>
                        <th>Class Div</th>
                        <th>Check</th>
                      </tr>
                    </thead>
                    
                    <tbody>

                  <?php
                      $query = "SELECT students.Id,students.admissionNumber,class.className,class.Id As classId,classDiv.classDivName,classDiv.Id AS classDivId,students.firstName,
                      students.lastName,students.admissionNumber,students.dateCreated
                      FROM students
                      INNER JOIN class ON class.Id = students.classId
                      INNER JOIN classDiv ON classDiv.Id = students.classDivId
                      where students.classId = '$_SESSION[classId]' and students.classDivId = '$_SESSION[classDivId]'";
                      $rs = $conn->query($query);
                      $num = $rs->num_rows;
                      $sn=0;
                      $status="";
                      if($num > 0)
                      { 
                        while ($rows = $rs->fetch_assoc())
                          {
                             $sn = $sn + 1;
                            echo"
                              <tr>
                                <td>".$sn."</td>
                                <td>".$rows['firstName']."</td>
                                <td>".$rows['lastName']."</td>
                                <td>".$rows['admissionNumber']."</td>
                                <td>".$rows['className']."</td>
                                <td>".$rows['classDivName']."</td>
                                <td><input name='check[]' type='checkbox' value=".$rows['admissionNumber']." class='form-control'></td>
                              </tr>";
                              echo "<input name='admissionNo[]' value=".$rows['admissionNumber']." type='hidden' class='form-control'>";
                          }
                      }
                      else
                      {
                           echo   
                           "<div class='alert alert-danger' role='alert'>
                            No Record Found!
                            </div>";
                      }
                      
                      ?>

                      <!-- the attendance showing code -->
                       


                    </tbody>
                  </table>
                  <br>
                  <!--<label for="attendanceDate">Attendance Date:</label>
                 <input type="date" id="attendanceDate" name="attendanceDate" required>-->
                  <button type="submit" name="save" class="btn btn-primary">Take Attendance</button>

                  </form>
                </div>
              </div>
            </div>
            </div>
          </div>
          <!--Row-->

          <!-- Documentation Link -->
          <!-- <div class="row">
            <div class="col-lg-12 text-center">
              <p>For more documentations you can visit<a href="https://getbootstrap.com/docs/4.3/components/forms/"
                  target="_blank">
                  bootstrap forms documentations.</a> and <a
                  href="https://getbootstrap.com/docs/4.3/components/input-group/" target="_blank">bootstrap input
                  groups documentations</a></p>
            </div>
          </div> -->

        </div>
        <!---Container Fluid-->
      </div>
      <!-- Footer -->
       <?php include "Includes/footer.php";?>
      <!-- Footer -->
    </div>
  </div>

  <!-- Scroll to top -->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="js/ruang-admin.min.js"></script>
   <!-- Page level plugins -->
  <script src="../vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="../vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script>
    $(document).ready(function () {
      $('#dataTable').DataTable(); // ID From dataTable 
      $('#dataTableHover').DataTable(); // ID From dataTable with Hover
    });
  </script>
</body>

</html>