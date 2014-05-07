<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once '../../config/init.php';
include_once $BASE_DIR . 'database/orders.php';

if ($_SESSION['permission'] != 1 && $_SESSION['permission'] != 2) {
    header('Location: ' . filter_input(INPUT_SERVER, 'HTTP_REFERER'));
}

$order_id = filter_input(INPUT_POST, 'orderId');
$state_id = filter_input(INPUT_POST, 'stateId');

if (!isset($order_id) || !isset($state_id)) {
    print_r("Invalid Request params.");
    exit();
}

$res = setOrderState($order_id, $state_id);

print_r(json_encode($res));
