<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');
include_once($BASE_DIR .'database/orders.php');

//$orderId = filter_input(INPUT_GET, 'id');
$orderId = $_GET['id'];

$userid = filter_input(INPUT_GET, 'id');

$orderDetail = getOrderDetailById($orderId);
$orderTotal = getOrderTotal($orderId);
$orderLines = getOrderLinesById($orderId);


if ($_SESSION['permission'] != 1 && $_SESSION['permission'] != 2) {
    if ($_SESSION['email'] == null || $_SESSION['email'] != $orderDetail['email']) {
        header('Location: ' . $NO_ACCESS);
    }
}

if (!isset($orderId)) {
    print_r("Invalid Request params.");
    exit();
}


$smarty->assign('orderDetail', $orderDetail);
$smarty->assign('orderTotal', $orderTotal);
$smarty->assign('orderLines', $orderLines);

$smarty->display('users/order.tpl');

?>
