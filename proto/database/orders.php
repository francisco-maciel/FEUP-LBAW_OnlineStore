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
    $sql = 'SELECT * FROM Order_ WHERE date_placed <= LOCALTIMESTAMP ORDER BY date_placed DESC';
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->fetchAll();
}

/*
 * Retrieve batch of orders from db, ordered by date placed
 */
function getOrdersPortion($limit, $offset) {
    global $conn;
    $sql = "SELECT order_.idorder, order_.idstate,order_.date_placed , SUM(orderline.price_per_unit*orderline.quantity) AS OrderTotal
        FROM order_,orderline
        WHERE order_.idorder = orderline.idorder
        GROUP BY order_.idorder
        ORDER BY order_.date_placed
        OFFSET $offset LIMIT $limit;";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->fetchAll();
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function getOrdersByBuyer($idbuyer) {
    global $conn;
    $sql = 'SELECT * FROM order_, state WHERE order_.idbuyer=? AND order_.idstate=state.idstate ORDER BY order_.idorder';
    $stmt = $conn->prepare($sql);
    $stmt->execute(array($idbuyer));
    return $stmt->fetchAll();
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

function countOrders() {
    global $conn;
    $sql = 'SELECT count(order_.idorder) from order_;';
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
}
