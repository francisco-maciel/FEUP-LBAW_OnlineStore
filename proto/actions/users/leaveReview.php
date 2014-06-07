<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/comments.php');

if (!isset($_POST['comment']) || !isset($_POST['rating'])) {

    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}

$idProduct = filter_input(INPUT_POST, 'idProduct');
$idOrder = filter_input(INPUT_POST, 'idOrder');
$comment = filter_input(INPUT_POST, 'comment');
$rating = filter_input(INPUT_POST, 'rating');

global $conn;

try {
    $conn->beginTransaction();
    saveReview($idProduct, $idOrder, $comment, $rating);
}
catch (PDOException $e) {
    $conn->rollBack();

    $_SESSION['error_messages'][] = 'Error saving review'. $e->getMessage() ;
    $_SESSION['form_values'] = $_POST;
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}
$conn->commit();
$_SESSION['success_messages'][] = 'Raview saved successfully!';
header('Location: ' . $_SERVER['HTTP_REFERER']);
?>
