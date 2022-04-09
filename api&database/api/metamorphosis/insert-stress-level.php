<?php
include 'conn.php'; 
$result=array();
try {
$userid = $_POST['userid'];
$stress_level = $_POST['stress_level'];
$stress_percent = $_POST['stress_percent'];
$date_taken = $_POST['date_taken'];

$queryResult=$connect->query("INSERT INTO `tbl_stress_level`( `stress_level`, `stress_percent`, `userid`, `date_taken`) 
                                        VALUES ('$stress_level','$stress_percent','$userid','$date_taken')");

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
