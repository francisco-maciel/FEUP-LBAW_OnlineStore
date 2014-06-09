<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once '../../config/init.php';
include_once $BASE_DIR . 'database/products.php';

    $page = intval(filter_input(INPUT_GET, 'page'));
    $items_per_page = intval(filter_input(INPUT_GET, 'ipp'));
    $position = ($page-1)*$items_per_page;
    
    $min = filter_input(INPUT_GET, 'min');
    $max = filter_input(INPUT_GET, 'max');
    $orderby = filter_input(INPUT_GET, 'orderby');
    $order = filter_input(INPUT_GET, 'order');
    
    $res = getProductsByNameJS(filter_input(INPUT_GET, 's'),$position,$items_per_page, $min, $max, $orderby, $order);

print_r(json_encode($res));