<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');
include_once($BASE_DIR .'database/orders.php');


if ($_SESSION['permission'] != 1 && $_SESSION['permission'] != 2) {
    if ($_SESSION['email'] == null) {
        header('Location: ' . $NO_ACCESS);
    }
}

$userid = filter_input(INPUT_GET, 'id');

if ($_SESSION['email'] == null) {
    header('Location: ' . $NO_ACCESS);
}

if (isset($userid)) {
    //id was found (url_encoded)
    if ($_SESSION['permission'] != 1 && $_SESSION['permission'] != 2) {
        //but no admin is requesting it
            header('Location: ' . $NO_ACCESS);
    } else {
        $user = getUserById($userid);
    }
} else {
    $user = getBuyerByEmail($_SESSION['email']);
}

$smarty->assign('user', $user);

$smarty->display('users/profile.tpl');

?>
