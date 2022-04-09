<?php
include 'conn.php'; 
$result=array();
try {
$userid = $_POST['userid'];
$active = $_POST['active'];
$diagnosis_id = $_POST['diagnosis_id'];

$queryResultOne=$connect->query("UPDATE `tbl_diagnosis` SET`isActiveDiagnosis`='$active' 
                                WHERE userid = '$userid' and diagnosis_ID = '$diagnosis_id'");
$queryResultTwo=$connect->query("UPDATE `tbl_plan` SET `isActive`='$active' 
                                WHERE userid = '$userid' and diagnosis_ID = '$diagnosis_id'");
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
