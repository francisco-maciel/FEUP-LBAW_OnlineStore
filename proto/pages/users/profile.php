<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');
include_once($BASE_DIR .'database/orders.php');

if ($_SESSION['permission'] == Permisson::NONE ) {
    header('Location: ' . $BASE_URL);
}

/*
 * ******* Changes **********
 *
 * Date: 19-05-2014
 * What: Make this script show a user profile by id passed by GET,
 * only if it is an Admin/Manager requesting
 * Author: Vitor Mota
 *
 * ************************* */

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
