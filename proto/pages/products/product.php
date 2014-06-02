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



  $specs = getProductSpecs($_GET['id']);



  $addWishListButton = false;
  if (isset($_SESSION['permission']) && isset($_SESSION['email'])) {

      $addWishListButton = !isOnWishList($_SESSION['email'], $_GET['id']);
  }

  $smarty->assign('product', $product);


  $smarty->assign('specs', $specs);

  $smarty->assign('addWishListButton', $addWishListButton);
// TODO USAR No template

  $smarty->display('products/product.tpl');

  ?>