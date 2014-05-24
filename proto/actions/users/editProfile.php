<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');

if (!isset($_POST['realname']) || !isset($_POST['email']) || !isset($_POST['street']) || !isset($_POST['door']) ||
    !isset($_POST['postcode']) || !isset($_POST['city']) || !isset($_POST['phone']) || !isset($_POST['nif'])) {

    $_SESSION['error_messages'][] = 'why here? are mandatory';
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/profile.php');
    exit;
}

$realname = strip_tags($_POST['realname']);
$email = strip_tags($_POST['email']);
$street = strip_tags($_POST['street']);
$door = strip_tags($_POST['door']);
$postcode = strip_tags($_POST['postcode']);
$city = strip_tags($_POST['city']);
$phone = strip_tags($_POST['phone']);
$nif = strip_tags($_POST['nif']);
//$birthdate = strip_tags($_POST['year']."-".$_POST['month']."-".$_POST['day']) ;
$old_email = $_SESSION['email'];

global $conn;

try {
    $conn->beginTransaction();
    updateProfile($old_email, $email, $realname, $phone, $street, $door, $postcode, $city, $nif);
}
catch (PDOException $e) {
    $conn->rollBack();

    if(strpos($e->getMessage(), 'uq_user_email') !== false)  {
        $_SESSION['error_messages'][] = 'Duplicate email';
        $_SESSION['field_errors']['username'] = 'Email already exists';
    }
    else if(strpos($e->getMessage(), 'uq_buyer_nif') !== false) {
        $_SESSION['error_messages'][] = 'Duplicate nif';
        $_SESSION['field_errors']['username'] = 'Nif already exists';
    }
    else  $_SESSION['error_messages'][] = 'Error editing profile'. $e->getMessage() ;

    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/profile.php');
    exit;
}
$_SESSION['success_messages'][] = 'Profile edited successfully';
header('Location: ' . $_SERVER['HTTP_REFERER']);
?>
