<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once '../../config/init.php';
include_once $BASE_DIR . 'database/users.php';

if ($_SESSION['permission'] != 2) {
    header('Location: ' . $NO_ACCESS);
}

$offset = filter_input(INPUT_GET, 'offset');
$limit = filter_input(INPUT_GET, 'limit');

$colname = filter_input(INPUT_GET, 'col');
$text = filter_input(INPUT_GET, 'text');

if (isset($offset) && isset($limit)) {
    if (isset($colname) && isset($text)) {
        $res = getUsersPortionFilter($limit, $offset, $colname, $text);
    } else {
        $res = getUsersNoAdminsPortion($limit, $offset);
    }
} else {
    $res = getUsersNoAdmins();
}


print_r(json_encode($res));
