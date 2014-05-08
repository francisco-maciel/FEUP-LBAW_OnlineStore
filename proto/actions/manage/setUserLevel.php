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

$level = filter_input(INPUT_POST, 'level');
$userId = filter_input(INPUT_POST, 'userId');

if (!isset($userId) || !isset($level)) {
    print_r("Invalid Request params.");
    exit();
}

if ($level === "Buyer") {
    $level = 0;
} else if ($level === "Manager") {
    $level = 1;
} else {
    print_r("Invalid user level, only Buyer and Manager are possible");
}

$res = setUserLevel($userId, $level);

print_r(json_encode($res));
