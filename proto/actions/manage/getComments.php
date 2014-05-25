<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once '../../config/init.php';
include_once $BASE_DIR . 'database/comments.php';


if ($_SESSION['permission'] != 1 && $_SESSION['permission'] != 2) {
    header('Location: ' . $NO_ACCESS);
}

$offset = filter_input(INPUT_GET, 'offset');
$limit = filter_input(INPUT_GET, 'limit');

if (isset($offset) && isset($limit)) {
    $res = getCommentsPortion($limit, $offset);
} else {
    $res = getComments();
}



print_r(json_encode($res));
