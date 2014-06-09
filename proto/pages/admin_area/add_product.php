<?php

include_once '../../config/init.php';
include_once $BASE_DIR . 'database/products.php';

if ($_SESSION['permission'] != 1 && $_SESSION['permission'] != 2) {
    header('Location: ' . $BASE_URL);
}
$smarty->assign('no_cart', true);

$param = filter_input(INPUT_GET, 'id');

if ($param) {
    $param = '?id=' . $param;
    $smarty->assign('param', $param);
}

$smarty->display('manage/add_product.tpl');