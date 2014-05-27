<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once('../../config/init.php');
include_once $BASE_DIR . 'database/genericDB.php';

if ($_SESSION['permission'] != 1 && $_SESSION['permission'] != 2) {
    header('Location: ' . $NO_ACCESS);
}

$table = filter_input(INPUT_GET, 'table');
$field = filter_input(INPUT_GET, 'field');
$text = filter_input(INPUT_GET, 'text');

$res = containsSubqueryCount($table, $field, $text);

print_r(json_encode($res));
