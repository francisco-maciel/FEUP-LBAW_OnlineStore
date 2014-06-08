<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/products.php');

if ($_SESSION['permission'] != Permisson::BUYER ) {
    header('Location: ' . $BASE_URL);
}

$products = getWishListProducts($_SESSION['email']);


if (empty($products)) $smarty->assign('message', 'No items on your wish list');
else  $smarty->assign('message', false);



$smarty->assign('products', $products);

$smarty->display('users/wish_list.tpl');
?>
