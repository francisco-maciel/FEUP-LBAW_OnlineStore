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
  $addWishListButton = false;
  if (isset($_SESSION['permission']) && isset($_SESSION['email'])) {

      $addWishListButton = !isOnWishList($_SESSION['email'], $_GET['id']);
      $purchased = purchasedProductBuyer($_SESSION['email'], $_GET['id']);
      $reviewed = productReviewdByBuyer($_SESSION['email'], $_GET['id']);
  }

  $averageRating = averageRatingByProduct($_GET['id']);
  $reviews = reviewsByProduct($_GET['id']);

  $smarty->assign('product', $product);
  $smarty->assign('addWishListButton', $addWishListButton);
  $smarty->assign('purchased', $purchased);
  $smarty->assign('reviewed', $reviewed);
  $smarty->assign('averageRating', $averageRating);
  $smarty->assign('reviews', $reviews);

// TODO USAR No template
  $smarty->display('products/product.tpl');

  ?>