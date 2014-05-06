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
