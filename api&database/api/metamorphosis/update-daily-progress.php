<?php
include 'conn.php'; 
$result=array();
try {
$userid = $_POST['userid'];

$date_taken = $_POST['date_taken'];


$queryResult=$connect->query("UPDATE `tbl_daily_progress` SET `progress_daily`='0',`date_taken`='$date_taken' WHERE userid = '$userid'");

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
