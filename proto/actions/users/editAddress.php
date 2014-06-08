<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/address.php');
include_once($BASE_DIR .'database/users.php');

if (!isset($_POST['street']) || !isset($_POST['door']) || !isset($_POST['postcode']) || !isset($_POST['city'])) {

    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}

$street = filter_input(INPUT_POST, 'street');
$door = filter_input(INPUT_POST, 'door');
$postcode = filter_input(INPUT_POST, 'postcode');
$city = filter_input(INPUT_POST, 'city');

$email = $_SESSION['email'];
$iduser = getIdByEmail($email);

global $conn;

try {
    $conn->beginTransaction();
    editBuyerAddress($street, $door, $postcode, $city, $iduser);
}
catch (PDOException $e) {
    $conn->rollBack();

    $_SESSION['error_messages'][] = 'Error editing Address'. $e->getMessage() ;

    $_SESSION['form_values'] = $_POST;
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}
$conn->commit();
$_SESSION['success_messages'][] = 'Address edited successfully';
header('Location: ' . $_SERVER['HTTP_REFERER']);
?>
