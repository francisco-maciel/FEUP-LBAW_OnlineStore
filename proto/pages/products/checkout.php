<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/products.php');

if (!isset($_SESSION['permission']))     header('Location: ' . $BASE_URL);

if ($_SESSION['permission'] != Permisson::BUYER ) {
    header('Location: ' . $BASE_URL);
}

  $products = getProductsByName("",0,1000000);

  $smarty->assign('products', $products);

  $smarty->assign('no_cart', true);
  $smarty->display('products/checkout.tpl');

?>