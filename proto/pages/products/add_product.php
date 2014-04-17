<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once '../../config/init.php';
include_once $BASE_DIR . 'database/products.php';

$prod_result = addProduct($_POST['prod_title'], $_POST['prod_desc'], $_POST['prod_price'], $_POST['prod_stock']);

if ($prod_result == FALSE) {
    //The operation failed
    
} else {
    
}