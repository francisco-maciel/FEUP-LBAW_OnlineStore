<?php

function getAllProcucts() {
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM product");
    $stmt->execute();
    return $stmt->fetchAll();
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

function getProductById($id) {
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM product WHERE idproduct=?");
    $stmt->execute(array($id));
    return $stmt->fetch();
}

function addProduct($title, $description, $price, $stock) {
    global $conn;

    $stmt = $conn->prepare("INSERT INTO product(title,description,price,stock) VALUES (?,?,?,?)");

    return $stmt->execute(array($title, $description, $price, $stock));
}

?>
