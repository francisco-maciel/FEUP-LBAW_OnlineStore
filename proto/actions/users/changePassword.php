<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/users.php');

if (!isset($_POST['oldPassword']) || !isset($_POST['password'])) {

    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/profile.php');
    exit;
}

$oldPassword = strip_tags($_POST['oldPassword']);
$password = strip_tags($_POST['password']);
$confirmPassword = strip_tags($_POST['confirmPassword']);
$email = $_SESSION['email'];

if (isLoginCorrect($email, $oldPassword) == -1) {
    $_SESSION['error_messages'][] = 'Old password not correct';
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/profile.php');
    exit;
}

if ($password == $oldPassword) {
    $_SESSION['error_messages'][] = 'No change in password';
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/profile.php');
    exit;
}


global $conn;
try {
    changePassword($email, $oldPassword, $password);
} catch (PDOException $e) {
    $conn->rollBack();
    header("Location: $BASE_URL" . 'pages/users/profile.php');
    exit;
}

$_SESSION['success_messages'][] = 'Password changed successfully';
header('Location: ' . $_SERVER['HTTP_REFERER']);
?>
