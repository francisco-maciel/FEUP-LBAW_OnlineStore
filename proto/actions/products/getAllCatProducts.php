<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once '../../config/init.php';
include_once $BASE_DIR . 'database/products.php';

    $res = getFilteredProductsByCat(filter_input(INPUT_GET, 'cid'));

print_r(json_encode($res));