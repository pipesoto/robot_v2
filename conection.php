
<?php
$mysqli = new mysqli("localhost", "root","","bxp");// coneccion a servidor

if(mysqli_connect_errno()){
	echo 'coneccion fallida : ', mysqli_connect_error();
	exit();
}
	


?>