<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/products.php');



  $smarty->assign('no_cart', true);
  $smarty->display('products/checkout.tpl');



?>