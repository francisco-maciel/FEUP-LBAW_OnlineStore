<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once('../../config/init.php');
include_once($BASE_DIR . 'database/products.php');

###############################################################################
##  API - GET
##  Product Details
###############################################################################

$id = filter_input(INPUT_GET, 'id');
if (!$id) {
    print_r(json_encode(array("error" => "No id specified")));
} else {
    $prod = getProductById($id);
    print_r(json_encode($prod));
}