<?php
include 'conn.php'; 
$result=array();
try {
$userid = $_POST['userid'];
$new_progress_value = $_POST['new_progress_value'];

$queryResult=$connect->query("UPDATE `tbl_daily_progress` SET `progress_daily`='$new_progress_value' WHERE userid = '$userid'");

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
