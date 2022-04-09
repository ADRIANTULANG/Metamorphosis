<?php
include 'conn.php'; 
$result=array();
try {
$userid = $_POST['userid'];
$self_care_type = $_POST['self_care_type'];
$overall_health = $_POST['overall_health'];


$queryResult=$connect->query("INSERT INTO `tbl_overall_health_selfcare`( `self_care_type`, `overall_health`, `userid`) 
                              VALUES ('$self_care_type','$overall_health','$userid')");

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
