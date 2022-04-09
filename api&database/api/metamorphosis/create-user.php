<?php
include 'conn.php'; 
$result=array();
try {
$username = $_POST['username'];
$password = $_POST['password'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$birthday = $_POST['birthday'];
$age = $_POST['age'];
$gender = $_POST['gender'];
$height = $_POST['height'];
$weight = $_POST['weight'];
$address = $_POST['address'];
$career = $_POST['career'];

$queryResult=$connect->query("INSERT INTO `tbl_users`(`username`, `password`, `email`, `phone`, `firstname`, `lastname`, `birthday`, `age`, `gender`, `height`, `weight`, `address`, `career`)
 VALUES ('$username','$password','$email','$phone','$firstname','$lastname','$birthday','$age','$gender','$height','$weight','$address','$career')");

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
