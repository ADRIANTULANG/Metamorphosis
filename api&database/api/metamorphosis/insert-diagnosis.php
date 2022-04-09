<?php
include 'conn.php'; 
$result=array();
try {
$userid = $_POST['userid'];
$diagnosis = $_POST['diagnosis'];
$score = $_POST['score'];
$assestment_type = $_POST['assestment_type'];
$isActiveDiagnosis = $_POST['isActiveDiagnosis'];

$queryResult=$connect->query("INSERT INTO `tbl_diagnosis`(`userid`, `diagnosis`,`score`, `assestment_type`, `isActiveDiagnosis`) VALUES ('$userid','$diagnosis','$score','$assestment_type','$isActiveDiagnosis')");
$last_inserted_ID=$connect->query("SELECT LAST_INSERT_ID() as id");
while($fetchData=$last_inserted_ID->fetch_assoc()){
$result[]=$fetchData;
}
$result = array(

	'success' => true, 'data'=> $result, 'message' => 'Success'

);
} catch (Exception $e) {
	$result = array(

        'success' => false, 'message' => 'Error. Please try again. ' . $e

    );
}
echo json_encode($result);
?>
