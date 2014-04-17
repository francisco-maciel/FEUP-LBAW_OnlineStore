<?php

function getAllProcucts() {
	global $conn;
	$stmt = $conn->prepare("SELECT * FROM product");
	$stmt->execute();
	return $stmt->fetchAll();
}


?>