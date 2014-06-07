<?php
include_once('../../config/init.php');

$name = filter_input(INPUT_POST, 'name');
$email = filter_input(INPUT_POST, 'email');
$subject = filter_input(INPUT_POST, 'subject');
$message = filter_input(INPUT_POST, 'message');

$headers = "[Loja Online Cliente: ".$email;

$success =  mail ("ei08162@fe.up.pt", $subject , $message, $headers);

if($success)
{
    $_SESSION['success_messages'][] = 'Message send successfully, thanks for contacting us!';
    header('Location: ' . $BASE_URL);
}
else
{
    $_SESSION['error_messages'][] = 'Error sending message'. $e->getMessage() ;
    $_SESSION['form_values'] = $_POST;
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}

?>
