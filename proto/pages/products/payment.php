<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/products.php');

if (!isset($_SESSION['permission']))     header('Location: ' . $BASE_URL);

if ($_SESSION['permission'] != Permisson::BUYER ) {
    header('Location: ' . $BASE_URL);
}

  $smarty->assign('no_cart', true);
  $smarty->display('products/payment.tpl');

?>