<?php

function getAllProcucts() {
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM product");
    $stmt->execute();
    return $stmt->fetchAll();
}

function updateProduct($id, $title, $description, $price, $stock, $img) {
    global $conn;

    $stmt = $conn->prepare("UPDATE product SET "
            . "title = '?', img = '?', description = '?', price = '?', stock = '?' "
            . "WHERE idproduct = $id");

    return $stmt->execute(array($title, $img, $description, $price, $stock));
}

function getNotRemovedProducts() {
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM product WHERE removed=false");
    $stmt->execute();
    return $stmt->fetchAll();
}

function getProductsByName($namepart) {
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM product WHERE LOWER(title) LIKE LOWER(?) and removed=false");
    $stmt->execute(array("%" . $namepart . "%"));
    return $stmt->fetchAll();
}

//Full details
function getProductById($id) {
    global $conn;
    $stmt = $conn->prepare("SELECT product.idproduct, product.title,
        product.stock, product.price,
        pf.idfilter, pf.value_string, pf.value_int, cat.idcategory,
        cat.iddepartment, f.filter_name
        FROM product
        INNER JOIN prodfilter pf
        ON pf.idproduct = product.idproduct
        INNER JOIN catfilter cf
        ON pf.idfilter = cf.idfilter
        INNER JOIN category cat
        ON cf.idcategory = cat.idcategory
        INNER JOIN filter f
        ON f.idfilter = pf.idfilter
        WHERE product.idproduct = $id");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

//DEPRECATED - use getNextProdId
function getMaxProdId() {
    global $conn;
    $stmt = $conn->prepare("SELECT Max(idproduct) FROM product");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_OBJ);
}

function getNextProdId() {
    global $conn;
    $stmt = $conn->prepare("SELECT last_value FROM product_idproduct_seq");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_OBJ);
}

function addProduct($title, $description, $price, $stock, $img) {
    global $conn;

    $stmt = $conn->prepare("INSERT INTO product(title,description,price,stock,img) VALUES (?,?,?,?,?)");

    return $stmt->execute(array($title, $description, $price, $stock, $img));
}
