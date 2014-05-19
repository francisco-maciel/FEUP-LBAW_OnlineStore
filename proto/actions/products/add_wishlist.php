<?php

  $result;
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/products.php');

  if ( !isset($_GET['productid'])) {

    $result['error'] = 'Missing product to add to the wish list!';
    echo json_encode($result);
    exit;
  }


    if (!isset($_SESSION['email']) || !isset($_SESSION['permission'])) {
        $result['error'] = 'Login needed';
        echo json_encode($result);
        exit;
    }

    if ($_SESSION['permission'] != Permisson::BUYER) {
        $result['error'] = 'Only a buyer can have a wish list';
        echo json_encode($result);
        exit;
    }

  $id = strip_tags($_GET['productid']);
  $email = strip_tags($_SESSION['email']);


global $conn;

  try {
      addProductToWishList($email, $id);
  }
  catch (PDOException $e) {

    $result['error'] = $e->getMessage();
    echo json_encode($result);
    exit;
  }
 $result['success'] = 'ok';
 echo json_encode($result);
?>
