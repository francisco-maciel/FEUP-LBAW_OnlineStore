<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');
include_once($BASE_DIR .'database/orders.php');

$user = getBuyerByEmail($_SESSION['email']);
$myOrders = getOrdersByBuyer($user['iduser']);

if ($_SESSION['permission'] != 1 && $_SESSION['permission'] != 2) {
    if ($_SESSION['email'] == null) {
        header('Location: ' . $NO_ACCESS);
    }
}

$smarty->assign('user', $user);
$smarty->assign('myOrders', $myOrders);

$smarty->display('users/myOrders.tpl');

?>
