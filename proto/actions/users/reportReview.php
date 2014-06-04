<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/comments.php');

$idReview = filter_input(INPUT_POST, 'reviewID');

global $conn;

try {
    $conn->beginTransaction();
    reportReview($idReview);
}
catch (PDOException $e) {
    $conn->rollBack();

    $_SESSION['error_messages'][] = 'Error saving review'. $e->getMessage() ;
    $_SESSION['form_values'] = $_POST;
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}
$conn->commit();
$_SESSION['success_messages'][] = 'Raview reported successfully!';
header('Location: ' . $_SERVER['HTTP_REFERER']);
?>
