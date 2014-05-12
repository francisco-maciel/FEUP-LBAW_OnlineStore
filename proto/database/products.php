<?php

function getAllProcucts() {
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM product");
    $stmt->execute();
    return $stmt->fetchAll();
}

function updateProduct($id, $title, $description, $price, $stock, $img) {
    global $conn;

    $sql = 'UPDATE product SET title =?, ' .
            ($img ? 'img =' . $img . ',' : '') .
            ' description =?, price = ?, stock = ? WHERE idproduct = ?';

    $stmt = $conn->prepare($sql);
    return $stmt->execute(array($title, $description, $price, $stock, $id));
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

//Return a product filers by prod id
function getProductFilters($prod_id) {
    global $conn;
    $stmt = $conn->prepare("SELECT * from filter
                    INNER JOIN prodfilter
                    ON filter.idfilter = prodfilter.idfilter
                    WHERE prodfilter.idproduct = $prod_id");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

//Full details, except filters
function getProductById($id) {
    global $conn;
    $stmt = $conn->prepare("SELECT product.idproduct, product.title,
        product.stock, product.price,
        product.img, product.description,
        cat.idcategory,
        cat.iddepartment
        FROM product
        INNER JOIN prodfilter pf
        ON pf.idproduct = product.idproduct
        INNER JOIN catfilter cf
        ON pf.idfilter = cf.idfilter
        INNER JOIN category cat
        ON cf.idcategory = cat.idcategory
        INNER JOIN filter f
        ON f.idfilter = pf.idfilter
        WHERE product.idproduct = $id
        GROUP BY cat.idcategory, product.idproduct");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
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

function addProduct($title, $description, $price, $stock, $img, $catid) {
    global $conn;

    $stmt = $conn->prepare("INSERT INTO product(title,description,price,stock,img,idcategory) VALUES (?,?,?,?,?,?)");

    return $stmt->execute(array($title, $description, $price, $stock, $img, $catid));
}
