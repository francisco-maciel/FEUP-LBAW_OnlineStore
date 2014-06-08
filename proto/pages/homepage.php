<?php
  include_once('../config/init.php');
  include_once($BASE_DIR .'database/products.php');
  include_once($BASE_DIR .'database/departments.php');
  
  $products = getNotRemovedProducts();
  $smarty->assign('products', $products);

  $departments = getAllDepartmentsSmarty();
  $smarty->assign('departments', $departments);

  if (isset($_SESSION['permission'])) {
      if ($_SESSION['permission'] == Permisson::MANAGER || $_SESSION['permission'] == Permisson::ADMIN ){
          $smarty->assign('no_cart', true);

      }
  }


  $smarty->display('common/homepage.tpl');
?>
