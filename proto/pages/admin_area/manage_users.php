<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once '../../config/init.php';
include_once $BASE_DIR . 'database/users.php';

if ($_SESSION['permission'] != 1 && $_SESSION['permission'] != 2) {
    header('Location: ' . $BASE_URL);
}

$user_banned = filter_input(INPUT_GET, 'userBanned');

//if ($user_banned == 1) {
//    $smarty->assign('SUCCESS_MESSAGES', $_GET);
//}

$count = countBuyers();

$smarty->assign('no_cart', true);

$smarty->assign('pages', (int) ($count['count'] / 20));

$smarty->display('manage/manage_users.tpl');
