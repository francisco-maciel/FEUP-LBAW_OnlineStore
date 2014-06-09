<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once '../../config/init.php';
include_once $BASE_DIR . 'database/filters.php';

$filters = json_decode(filter_input(INPUT_GET, 'filters'), true);
$min = filter_input(INPUT_GET, 'min');
$max = filter_input(INPUT_GET, 'max');

$res = getCountFilteredProdsWithCat(filter_input(INPUT_GET, 'cat'), $filters, $min, $max);

print_r(json_encode($res));