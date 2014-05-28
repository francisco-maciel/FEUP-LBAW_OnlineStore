<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/comments.php');

if (!isset($_POST['comment'])) {

    $_SESSION['error_messages'][] = 'No comment inserted';
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . $_SERVER['HTTP_REFERER']);
    exit;
}

$comment = filter_input(INPUT_POST, 'comment');

global $conn;

try {
    $conn->beginTransaction();

}
catch (PDOException $e) {
    $conn->rollBack();

}
$conn->commit();
$_SESSION['success_messages'][] = 'Comment inserted successfully';
header('Location: ' . $_SERVER['HTTP_REFERER']);
?>
