<?php
include 'conn.php'; 
$result=array();
try {
$week = $_POST['week'];
$progress_percent = $_POST['progress_percent'];
$userid = $_POST['userid'];
$dateStarted = $_POST['dateStarted'];

$queryResult=$connect->query("INSERT INTO `tbl_weekly_progress`( `week`, `progress_percent`, `userid`, `dateStarted`) 
                            VALUES ('$week','$progress_percent','$userid','$dateStarted')");

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
