<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/products.php');

if (!isset($_SESSION['permission']) || !isset($_SESSION['email'])) {

    $error['error'] = 'invalid login';
    echo json_encode($error);
    exit;
}
if ($_SESSION['permission'] != Permisson::BUYER) {
    $error['error'] = 'not a buyer';
    echo json_encode($error);
    exit;
}
if (!isset($_GET['id'])) {
    $error['error'] = 'invalid product id';
    echo json_encode($error);
    exit;
}

$answer['result'] = 'ok';
$answer['message'] =removeWishList($_SESSION['email'],$_GET['id'] );
$answer['id'] = $_GET['id'];
echo json_encode($answer);
?>