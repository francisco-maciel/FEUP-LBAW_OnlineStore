<?php
  include_once('../config/init.php');
  include_once($BASE_DIR .'database/products.php');
  include_once($BASE_DIR .'database/departments.php');
  
  $products = getNotRemovedProducts();
  $smarty->assign('products', $products);

  $departments = getAllDepartmentsSmarty();
  $smarty->assign('departments', $departments);
  
  $smarty->display('common/homepage.tpl');
?>
