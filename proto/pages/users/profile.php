<?php
include_once('../../config/init.php');
include_once($BASE_DIR .'database/users.php');
include_once($BASE_DIR .'database/orders.php');

$user = getBuyerByEmail($_SESSION['email']);
$smarty->assign('user', $user);

$smarty->display('users/profile.tpl');

?>
