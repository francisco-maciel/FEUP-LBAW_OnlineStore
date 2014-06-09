<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');

if (!isset($_POST['realname']) || !isset($_POST['street']) || !isset($_POST['door']) ||
    !isset($_POST['postcode']) || !isset($_POST['city']) || !isset($_POST['phone']) || !isset($_POST['nif'])) {

    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/profile.php');
    exit;
}

$realname = filter_input(INPUT_POST, 'realname');
$street = filter_input(INPUT_POST, 'street');
$door = filter_input(INPUT_POST, 'door');
$postcode = filter_input(INPUT_POST, 'postcode');
$city = filter_input(INPUT_POST, 'city');
$phone = filter_input(INPUT_POST, 'phone');
$nif = filter_input(INPUT_POST, 'nif');

$birthdate = strip_tags($_POST['day']."-".$_POST['month']."-".$_POST['year']) ;
$email = $_SESSION['email'];
$user_id = getIdByEmail($email);

if (nifExist($nif, $user_id)) {
    $_SESSION['error_messages'][] = 'Edit failed! NIF already exists, registered by another user!';
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/profile.php');
    exit;
}

global $conn;

try {
    $conn->beginTransaction();
    updateProfile($email, $realname, $phone, $birthdate, $street, $door, $postcode, $city, $nif, $user_id);
}
catch (PDOException $e) {
    $conn->rollBack();

    if(strpos($e->getMessage(), 'uq_buyer_nif') !== false) {
        $_SESSION['error_messages'][] = 'Duplicate nif';
        $_SESSION['field_errors']['username'] = 'Nif already exists';
    }
    else  $_SESSION['error_messages'][] = 'Error editing profile'. $e->getMessage() ;

    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/profile.php');
    exit;
}
$conn->commit();
$_SESSION['success_messages'][] = 'Profile edited successfully';
header('Location: ' . $_SERVER['HTTP_REFERER']);
?>
