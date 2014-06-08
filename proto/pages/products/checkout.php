<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/products.php');

    $products = getProductsByName("",0,1000000);

  $smarty->assign('products', $products);

  $smarty->assign('no_cart', true);
  $smarty->display('products/checkout.tpl');



?>