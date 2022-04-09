<?php
include 'conn.php'; 
$result=array();
try {
$userid = $_POST['userid'];
$week_id = $_POST['week_id'];
$new_progress_value = $_POST['new_progress_value'];


$queryResult=$connect->query("UPDATE `tbl_weekly_progress` SET `progress_percent`='$new_progress_value' WHERE userid = '$userid' AND progress_id = '$week_id'");

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
