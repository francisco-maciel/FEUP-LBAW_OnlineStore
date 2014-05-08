<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function getOrderStates() {
    global $conn;
    $sql = 'SELECT * FROM state';
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->fetchAll();
}

//BETA
function getOrders() {
    global $conn;
    $sql = 'SELECT * FROM Order_ WHERE date_placed <= LOCALTIMESTAMP ORDER BY date_placed DESC LIMIT 100';
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->fetchAll();
}

function getOrderTotal($id_order) {
    global $conn;
    $sql = 'SELECT SUM(price_per_unit * quantity) AS Total FROM OrderLine WHERE idOrder =' . $id_order;
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->fetch();
}

function setOrderState($idorder, $idstate) {
    global $conn;
    $sql = 'UPDATE order_ SET idstate = ? WHERE idorder = ?';
    $stmt = $conn->prepare($sql);
    return $stmt->execute(array($idstate, $idorder));
}
