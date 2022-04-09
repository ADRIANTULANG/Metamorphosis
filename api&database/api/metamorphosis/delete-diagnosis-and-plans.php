<?php
include 'conn.php'; 
$result=array();
try {
$userid = $_POST['userid'];


$tbldiagnosis_delete=$connect->query("DELETE FROM `tbl_diagnosis` WHERE userid = '$userid'");
$tblplan_Delete=$connect->query("DELETE FROM `tbl_plan` WHERE userid = '$userid'");
$tbloverallhealth_Delete=$connect->query("DELETE FROM `tbl_overall_health_selfcare` WHERE userid = '$userid'");

$result = array(

	'success' => true,'message' => 'Success'

);
} catch (Exception $e) {
	$result = array(

        'success' => false, 'message' => 'Error. Please try again. ' . $e

    );
}
echo json_encode($result);
?>
