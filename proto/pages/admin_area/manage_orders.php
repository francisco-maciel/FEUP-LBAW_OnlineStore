<?php

include_once '../../config/init.php';
include_once $BASE_DIR . 'database/orders.php';
include_once $BASE_DIR . 'database/genericDB.php';

if ($_SESSION['permission'] != 1 && $_SESSION['permission'] != 2) {
    header('Location: ' . $BASE_URL);
}

$count = countOrders();
$smarty->assign('no_cart', true);

$smarty->assign('pages', (int) ($count['count'] / 20));

$smarty->display('manage/manage_orders.tpl');
