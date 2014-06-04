<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function getDepartmentName($id) {
    global $conn;
    $stmt = $conn->prepare('SELECT name FROM department WHERE iddepartment=?');
    $stmt->execute(array($id));
    return $stmt->fetch();
}

function getAllDepartments() {
    global $conn;
    $stmt = $conn->prepare("SELECT iddepartment AS id, name FROM department");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_OBJ);
}

function getAllDepartmentsSmarty() {
	 global $conn;
    $stmt = $conn->prepare("SELECT * FROM department ORDER BY name");
    $stmt->execute();
    return $stmt->fetchAll();
}

function addDepartment($name) {
    global $conn;
    $stmt = $conn->prepare("INSERT INTO department(name) VALUES('$name')");
    return $stmt->execute();
}
