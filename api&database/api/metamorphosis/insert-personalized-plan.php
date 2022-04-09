<?php
include 'conn.php'; 
$result=array();
try {
$userid = $_POST['userid'];
$diagnosis_ID = $_POST['diagnosis_ID'];
$diagnosis = $_POST['diagnosis'];
$plan = $_POST['plan'];
$isDone = $_POST['isDone'];
$isTimer = $_POST['isTimer'];
$startDate = $_POST['startDate'];
$endDate = $_POST['endDate'];
$isScheduled = $_POST['isScheduled'];
$isActive = $_POST['isActive'];

$queryResult=$connect->query("INSERT INTO `tbl_plan`( `diagnosis`, `diagnosis_ID`, `plan`, `isDone`, `isTimer`, `startDate`, `endDate`, `userid`, `isScheduled`, `isActive`) 
                                                VALUES ('$diagnosis','$diagnosis_ID','$plan','$isDone','$isTimer','$startDate','$endDate','$userid','$isScheduled','$isActive')");

// while($fetchData=$queryResult->fetch_assoc()){
// $result[]=$fetchData;
// }
$result = array(

	'success' => true, 'message' => 'Success'

);
} catch (Exception $e) {
	$result = array(

        'success' => false, 'message' => 'Error. Please try again. ' . $e

    );
}
echo json_encode($result);
?>
