<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');
include_once($BASE_DIR .'database/orders.php');

$user = getBuyerByEmail($_SESSION['email']);
$smarty->assign('user', $user);

$myOrders = getOrdersByBuyer($user['iduser']);
$smarty->assign('myOrders', $myOrders);

$smarty->display('users/myOrders.tpl');

?>
