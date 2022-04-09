<?php
include 'conn.php'; 
$result=array();
try {
$userid = $_POST['userid'];


$queryResult=$connect->query("SELECT * FROM `tbl_weekly_progress` a WHERE a.userid = '$userid' ORDER BY a.progress_id DESC LIMIT 1");

while($fetchData=$queryResult->fetch_assoc()){
$result[]=$fetchData;
}
$data = array(

	'success' => true, 'data'=> $result, 'message' => 'Success'

);
} catch (Exception $e) {
	$data = array(

        'success' => false, 'message' => 'Error. Please try again. ' . $e

    );
}
echo json_encode($data);
?>
