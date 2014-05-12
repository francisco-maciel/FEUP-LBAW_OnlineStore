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

  $show_wish_list = false;
  if (isset($_SESSION['permission']) && isset($_SESSION['email'])) {
      if ($_SESSION['permission'] == Permisson::BUYER) $show_wish_list = true;

      $addWishListButton = !isOnWishList($_SESSION['email'], $_GET['id']);
  }

  $smarty->assign('product', $product);
  $smarty->assign('show_wish_list', $product);
  $smarty->assign('addWishListButton', $product);
// TODO USAR No template
  $smarty->display('products/product.tpl');

  ?>