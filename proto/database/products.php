<?php

function getAllProcucts() {
	global $conn;
	$stmt = $conn->prepare("SELECT * FROM product");
	$stmt->execute();
	return $stmt->fetchAll();
}

function getNotRemovedProducts() {
	global $conn;
	$stmt = $conn->prepare("SELECT * FROM product WHERE removed=false");
	$stmt->execute();
	return $stmt->fetchAll();
}

function getProductsByName($namepart){
 global $conn;
 $stmt = $conn->prepare("SELECT * FROM product WHERE title LIKE '%$namepart%' and removed=false");
    $stmt->execute();
    return $stmt->fetchAll();
}


?>