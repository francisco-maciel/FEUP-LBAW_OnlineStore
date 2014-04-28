<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



function getAllDepartments() {
    global $conn;
    $stmt = $conn->prepare("SELECT iddepartment AS id, name FROM department");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_OBJ);
}

function getAllDepartmentsSmarty() {
	 global $conn;
    $stmt = $conn->prepare("SELECT * FROM department");
    $stmt->execute();
    return $stmt->fetchAll();
}