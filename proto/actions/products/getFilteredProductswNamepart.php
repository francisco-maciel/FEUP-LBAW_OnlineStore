<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once '../../config/init.php';
include_once $BASE_DIR . 'database/filters.php';

$page = filter_input(INPUT_GET, 'page');
$items_per_page = filter_input(INPUT_GET, 'ipp');
$position = ($page-1)*$items_per_page;

$filters = json_decode(filter_input(INPUT_GET, 'filters'), true);

$res = getFilteredProductsWithName(filter_input(INPUT_GET, 's'), $filters, $position, $items_per_page);

print_r(json_encode($res));