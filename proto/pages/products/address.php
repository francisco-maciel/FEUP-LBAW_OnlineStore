<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/address.php');

if (!isset($_SESSION['permission']))     header('Location: ' . $BASE_URL);

if ($_SESSION['permission'] != Permisson::BUYER ) {
    header('Location: ' . $BASE_URL);
}


$addresses = getBuyerAddress($_SESSION['email']);

$smarty->assign('no_cart', true);


$smarty->assign('addresses', $addresses);
$smarty->display('products/address.tpl');
$smarty->assign('no_cart', true);

?>