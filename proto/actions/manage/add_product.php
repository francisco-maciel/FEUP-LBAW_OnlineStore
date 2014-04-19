<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once('../../config/init.php');
include_once($BASE_DIR .'database/products.php');

###############################################################################
#### TODO: Check if indeed is an admin requesting this page
#### TODO: Check the product has ONE department and ONE Category
#### TODO: Insert product and filters relations on DB
###############################################################################

//-----------------------------------------------------------------------------
// Add a product
//-----------------------------------------------------------------------------

//Should verify if _post data is set? It is already verified at form...
//but with javascript
$title = filter_input(INPUT_POST, 'prod_name');
$desc = filter_input(INPUT_POST, 'prod_desc');
$price = filter_input(INPUT_POST, 'prod_price');
$stock = filter_input(INPUT_POST, 'prod_stock');

global $conn;


try{
    //Start transaction and make all the changes
    $conn->beginTransaction();
    $res = addProduct($title, $desc, $price, $stock);
    //And commit if all where successfull
    $conn->commit();
}  catch (PDOException $excep){
    //If at least one crashed rollback all of them!
    $conn->rollBack();
    $_SESSION['error_messages'][] = $excep->getMessage();
}  catch (Exception $ex){
    $error = $excep->getMessage();
}

$_SESSION['success_messages'][] = 'Product added';