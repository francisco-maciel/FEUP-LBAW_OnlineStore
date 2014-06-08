<?php

  $result;
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/products.php');

$result['dump'] = $_POST;


  if ( !isset($_POST['orderDetail']) || !isset($_POST['orderDetail']) ||  !isset($_POST['orderLines']) ) {

    $result['error'] = 'Missing purchase data!';
    echo json_encode($result);
    exit;
  }


    if (!isset($_SESSION['email']) || !isset($_SESSION['permission'])) {
        $result['error'] = 'Login needed';
        echo json_encode($result);
        exit;
    }

    if ($_SESSION['permission'] != Permisson::BUYER) {
        $result['error'] = 'Only a buyer can purchase';
        echo json_encode($result);
        exit;
    }

/*
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
*/
 $result['success'] = 'ok';
 echo json_encode($result);

?>
