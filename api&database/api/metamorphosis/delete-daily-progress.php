<?php
include 'conn.php'; 
$result=array();
try {
$userid = $_POST['userid'];


$slq_delete=$connect->query("DELETE FROM `tbl_daily_progress` WHERE  userid = '$userid'");


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
