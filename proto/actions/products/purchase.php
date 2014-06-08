<?php

  $result;
  include_once '../../config/init.php';
  include_once $BASE_DIR .'database/products.php';
include_once $BASE_DIR .'database/users.php';



  if ( !isset($_POST['orderDetail']) || !isset($_POST['orderLines']) ||  !isset($_POST['orderTotal']) ) {

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

    $orderDetail = $_POST['orderDetail'];
    $orderLines = $_POST['orderLines'];
    $orderTotal = $_POST['orderTotal'];

    $user = getBuyerByEmail($_SESSION['email']);
try {

    global $conn;
    $date_signed = date("Y-n-j");

    $conn->beginTransaction();
    $stmt = $conn->prepare('INSERT INTO order_ VALUES (DEFAULT,?,DEFAULT,?,?,?,?,?) RETURNING idorder;');
    $stmt->execute(array($date_signed, null, 1, 1, $orderDetail['address'], $user['iduser']));
    $id = $conn->lastInsertId("order__idorder_seq");

    foreach ($orderLines as $line) {
        $stmt = $conn->prepare('INSERT INTO orderline VALUES (?,?,?,?);');
        $stmt->execute(array($line['id'], $id, $line['quantity'], $line['price_per_unit']));




    }


    $conn->commit();


    $result['success'] = 'ok';
    $result['id'] = $id;
    echo json_encode($result);
    exit;
}
catch (PDOException $e) {
    $conn->rollBack();
    $result['error'] = $e;
    echo json_encode($result);
    exit;
}

?>
