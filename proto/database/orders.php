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
//    $sql = "SELECT order_.idorder, order_.idstate,order_.date_placed , SUM(orderline.price_per_unit*orderline.quantity) AS OrderTotal
//        FROM order_,orderline
//        WHERE order_.idorder = orderline.idorder
//        GROUP BY order_.idorder
//        ORDER BY order_.date_placed
//        OFFSET $offset LIMIT $limit;";
    $sql = "SELECT * FROM order_sumup "
            . "OFFSET $offset LIMIT $limit;";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->fetchAll();
}

function getOrdersPortionFilter($limit, $offset, $col, $text) {
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM order_sumup "
            . "WHERE order_sumup.$col::varchar(255) ~* '$text' "
            . "OFFSET $offset LIMIT $limit;");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function getOrdersByBuyer($idbuyer) {
    global $conn;
    $sql = 'SELECT order_.idorder, state.name, order_.date_placed, order_.date_shipped, SUM(orderline.price_per_unit * orderline.quantity) AS ordertotal, transporter.price
            FROM order_, state, orderline, transporter WHERE order_.idbuyer=? AND order_.idstate=state.idstate AND order_.idorder = orderline.idorder AND order_.idtransporter = transporter.idtransporter GROUP BY order_.idorder,state.name, transporter.price ORDER BY order_.idorder';
    $stmt = $conn->prepare($sql);
    $stmt->execute(array($idbuyer));
    return $stmt->fetchAll();
}

function getOrderDetailById($idOrder) {
    global $conn;
    $sql = "SELECT order_.idorder AS orderid, user_.name AS buyername, user_.email, buyer.nif, address.street, address.door_nr, address.postcode, address.formatted_address, state.name AS orderstate,
          order_.date_placed, orderline.price_per_unit, orderline.quantity, orderline.price_per_unit * orderline.quantity AS subtotal, transporter.name AS transportername, transporter.price
          FROM order_, address, buyer, user_, state, orderline, transporter
          WHERE order_.idorder = ? AND order_.idaddress = address.idaddress AND order_.idbuyer = buyer.iduser
          AND order_.idbuyer = user_.iduser AND order_.idstate = state.idstate AND order_.idtransporter = transporter.idtransporter";
    $stmt = $conn->prepare( $sql);

    $stmt->execute(array($idOrder));
    return $stmt->fetch();
}

function getOrderLinesById($idOrder) {
    global $conn;
    $sql = "SELECT product.title, product.idproduct, orderline.price_per_unit, orderline.quantity, orderline.price_per_unit * orderline.quantity AS subtotal
          FROM order_, orderline, product
          WHERE order_.idorder = ? AND orderline.idorder = order_.idorder AND orderline.idproduct = product.idproduct";
    $stmt = $conn->prepare( $sql);

    $stmt->execute(array($idOrder));
    return $stmt->fetchAll();
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

function getOrderTotal($id_order) {
    global $conn;
    $sql = 'SELECT SUM(price_per_unit * quantity) AS total FROM OrderLine WHERE idOrder =' . $id_order;
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

function getTransporter() {
    global $conn;
    $sql = 'select * from transporter where idtransporter = 1;';
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
}