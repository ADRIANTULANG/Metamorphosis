<?php
include 'conn.php'; 
$result=array();
try {
$userid = $_POST['userid'];
$isDone= $_POST['isDone'];
$plan_id = $_POST['plan_id'];


$queryResult=$connect->query("UPDATE `tbl_plan` SET `isDone`='$isDone' WHERE plan_id = '$plan_id' and userid = '$userid'");

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
