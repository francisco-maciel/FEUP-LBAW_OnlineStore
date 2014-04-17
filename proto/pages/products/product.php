<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/products.php');


if (!$_GET['id']) {
    $_SESSION['error_messages'][] = 'Invalid product_id';
    $_SESSION['form_values'] = $_GET;
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
  }

  $product = getProductById($_GET['id']);


  $smarty->assign('product', $product);
  $smarty->display('products/product.tpl');

  ?>