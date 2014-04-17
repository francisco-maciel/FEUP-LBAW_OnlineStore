<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/products.php');

/*
if (!$_GET['search']) {
    $_SESSION['error_messages'][] = 'Invalid search';
    $_SESSION['form_values'] = $_GET;
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
  }
  */

  if (!$_GET['search']) {
    $products = getNotRemovedProducts(); 
  }
  else
  {
    $namepart = $_GET['search'];
    $products = getProductsByName($namepart);
  }
  
  
  /*
  foreach ($tweets as $key => $tweet) {
    unset($photo);
    if (file_exists($BASE_DIR.'images/users/'.$tweet['username'].'.png'))
      $photo = 'images/users/'.$tweet['username'].'.png';
    if (file_exists($BASE_DIR.'images/users/'.$tweet['username'].'.jpg'))
      $photo = 'images/users/'.$tweet['username'].'.jpg';
    if (!$photo) $photo = 'images/assets/default.png';
    $tweets[$key]['photo'] = $photo;
  }
  */

  //$smarty->assign('last_tweet_id', $tweets[0]['id']); 
  
  $smarty->assign('products', $products);
  $smarty->display('products/search.tpl');
?>
