<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once '../../config/init.php';
include_once $BASE_DIR . 'database/products.php';

$param = filter_input(INPUT_GET, 'id');

if ($param) {
    $param = '?id=' . $param;
    $smarty->assign('param', $param);
}

$smarty->display('manage/add_product.tpl');