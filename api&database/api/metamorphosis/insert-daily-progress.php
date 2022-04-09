<?php
include 'conn.php'; 
$result=array();
try {
$userid = $_POST['userid'];
$full_progress = $_POST['full_progress'];
$date_taken = $_POST['date_taken'];
$progress_daily = $_POST['progress_daily'];

$queryResult=$connect->query("INSERT INTO `tbl_daily_progress`( `progress_daily`, `full_progress`, `userid`, `date_taken`) 
                                                    VALUES ('$progress_daily','$full_progress','$userid','$date_taken ')");

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
