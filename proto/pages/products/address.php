<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/address.php');

$addresses = getBuyerAddress($_SESSION['email']);

$smarty->assign('addresses', $addresses);
$smarty->display('products/address.tpl');

?>