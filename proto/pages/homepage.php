<?php
  include_once('../config/init.php');
  include_once($BASE_DIR .'database/products.php');
  
  $products = getNotRemovedProducts();
  $smarty->assign('products', $products);
  
  $smarty->display('common/homepage.tpl');
?>
