<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once('../../config/init.php');
include_once($BASE_DIR . 'database/products.php');
include_once($BASE_DIR . 'database/filters.php');
include_once($BASE_DIR . 'database/departments.php');
include_once($BASE_DIR . 'database/categories.php');

if ($_SESSION['permission'] != 1 && $_SESSION['permission'] != 2) {
    header('Location: ' . $NO_ACCESS);
}

###############################################################################
#### DONE: Check if indeed is an admin or manager requesting this page
#### DONE: Check the product has ONE department and ONE Category
#### DONE: Insert product and filters relations on DB
#### TODO: Make this script able to process a product update
###############################################################################
//-----------------------------------------------------------------------------
// Add/Edit a product
//-----------------------------------------------------------------------------

$prod_id = filter_input(INPUT_GET, 'id');

if (isset($prod_id)) {
//means this is a product edition not creation
    $edition = TRUE;
} else {
    $prod_id = getNextProdId()->last_value + 1;
}


//Should verify if _post data is set? It is already verified at form...
//but with javascript
$title = filter_input(INPUT_POST, 'prod_name');
$desc = filter_input(INPUT_POST, 'prod_desc');
$price = filter_input(INPUT_POST, 'prod_price');
$stock = filter_input(INPUT_POST, 'prod_stock');
$img = $_FILES["prod_img"]["name"];
$cat_id = filter_input(INPUT_POST, 'prod_category');
$dep_id = filter_input(INPUT_POST, 'prod_family');

// FIle upload

$allowedExts = array("jpeg", "jpg", "png");
$temp = explode(".", $_FILES["prod_img"]["name"]);
$extension = end($temp);

$target_dir = $BASE_DIR . "images/products/$prod_id/";

if ((($_FILES["prod_img"]["type"] == "image/jpeg") || ($_FILES["prod_img"]["type"] == "image/jpg") || ($_FILES["prod_img"]["type"] == "image/pjpeg") || ($_FILES["prod_img"]["type"] == "image/x-png") || ($_FILES["prod_img"]["type"] == "image/png")) && ($_FILES["prod_img"]["size"] < 10000000) && in_array($extension, $allowedExts)) {
    if ($_FILES["prod_img"]["error"] > 0) {
        echo "Return Code: " . $_FILES["prod_img"]["error"] . "<br>";
    } else {
        echo "Upload: " . $_FILES["prod_img"]["name"] . "<br>";
        echo "Type: " . $_FILES["prod_img"]["type"] . "<br>";
        echo "Size: " . ($_FILES["prod_img"]["size"] / 1024) . " kB<br>";
        echo "Temp file: " . $_FILES["prod_img"]["tmp_name"] . "<br>";
        $dir = mkdir($target_dir);
        //echo $target_dir . $_FILES["prod_img"]["name"];
        $res = move_uploaded_file($_FILES["prod_img"]["tmp_name"], $target_dir . $_FILES["prod_img"]["name"]);
//        if (!$res) {
//            echo 'Failed to upload image';
//            exit();
//        }
        echo "Stored in: " . "images/" . ($prod_id + 1) . "/" . $_FILES["prod_img"]["name"];
    }
} else {
    echo "Invalid file";
    $no_img = TRUE;
}

//parse dynamic attributes

$attr_name = filter_input(INPUT_POST, 'attr_name1');
$attr_value = filter_input(INPUT_POST, 'attr_value1');

$name_arr = array();
$value_arr = array();
$type_arr = array();
$index = 0;

while ($attr_name && $attr_value) {
    $name_arr[$index] = $attr_name;
    $value_arr[$index] = $attr_value;
    if (!is_numeric($attr_value)) {
        $type_arr[$index] = 0;
    } else {
        $type_arr[$index] = 1;
    }
    //prepare next iteration
    $index++;
    // + 1 is the offset ($index starts at 0)
    $attr_name = filter_input(INPUT_POST, 'attr_name' . ($index + 1));
    $attr_value = filter_input(INPUT_POST, 'attr_value' . ($index + 1));
}

global $conn;


try {
    //Start transaction and make all the changes
    $conn->beginTransaction();
    if ($edition) {
        //edit a product
        $res_prod = updateProduct($prod_id, $title, $desc, $price, $stock, $no_img ? null : "$prod_id/$img");
    } else {
        //add a product
        $res_prod = addProduct($title, $desc, $price, $stock, "$prod_id/$img", $cat_id);
    }
    //add filters
    addFilters_failsafe($name_arr);
    $filter_ids = getFilterIdsByName_BULK($name_arr);
    //populate prodFilter table
    if ($value_arr) {
        //getting here means some dynamic categories where added
        addFiltersProduts_Rel($prod_id, $filter_ids, $type_arr, $value_arr);
        //populate catFilter table
        addCatFilter_Rel($cat_id, $filter_ids);
    }
    //And commit if all where successfull
    $conn->commit();
    $_SESSION['success_messages']["prod_success"] = "Product added!";
} catch (PDOException $excep) {
    //If at least one crashed rollback all of them!
    $conn->rollBack();
    $_SESSION['error_messages'][] = $excep->getMessage();
} catch (Exception $ex) {
    //DEBUG
    $error = $excep->getMessage();
}


header('Location: ' . filter_input(INPUT_SERVER, 'HTTP_REFERER'));
