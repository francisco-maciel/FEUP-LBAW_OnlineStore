<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');
include_once($BASE_DIR .'database/orders.php');

//$orderId = filter_input(INPUT_GET, 'id');
$orderId = $_GET['id'];

if (!isset($orderId)) {
    print_r("Invalid Request params.");
    exit();
}

$orderDetail = getOrderDetailById($orderId);
$orderTotal = getOrderTotal($orderId);
$orderLines = getOrderLinesById($orderId);

$smarty->assign('orderDetail', $orderDetail);
$smarty->assign('orderTotal', $orderTotal);
$smarty->assign('orderLines', $orderLines);

$smarty->display('users/order.tpl');

?>
