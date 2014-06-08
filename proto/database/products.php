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

function getProductsByName($namepart, $position, $item_per_page) {
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM product WHERE LOWER(title) LIKE LOWER(?) AND removed=false
                            ORDER BY product.title LIMIT $item_per_page OFFSET $position");
    $stmt->execute(array("%" . $namepart . "%"));
    return $stmt->fetchAll();
}

function getProductsByNameJS($namepart, $position, $items_per_page) {
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM product WHERE LOWER(title) LIKE LOWER(?) AND removed=false
                            ORDER BY product.title LIMIT $items_per_page OFFSET $position");
    $stmt->execute(array("%" . $namepart . "%"));
    return $stmt->fetchAll(PDO::FETCH_OBJ);
}

function getProdCountByName($namepart) {
    global $conn;
    $stmt = $conn->prepare("SELECT Count(*) as count FROM product WHERE LOWER(title) LIKE LOWER(?) AND removed=false");
    $stmt->execute(array("%" . $namepart . "%"));
    return $stmt->fetch();
}


function getProductsByCat($idcat, $position, $item_per_page) {
    global $conn;
   $stmt = $conn->prepare("SELECT product.idproduct, product.title,
        product.stock, product.price,
        product.img, product.description,
        product.idcategory, cat.name
        FROM product
        INNER JOIN category cat
        ON cat.idcategory = product.idcategory
        WHERE cat.idcategory = ?
        AND removed=false
        ORDER BY product.title LIMIT $item_per_page OFFSET $position");
    $stmt->execute(array($idcat));
    return $stmt->fetchAll();
}

function getProdCountByCat($idcat) {
    global $conn;
   $stmt = $conn->prepare("SELECT Count(*) as count
        FROM product
        INNER JOIN category cat
        ON cat.idcategory = product.idcategory
        WHERE cat.idcategory = ?
        AND removed=false");
    $stmt->execute(array($idcat));
    return $stmt->fetch();
}

function getFilteredProductsByCat($idcat, $position, $items_per_page) {
    global $conn;
   $stmt = $conn->prepare("SELECT product.idproduct, product.title,
        product.stock, product.price,
        product.img, product.description,
        product.idcategory, cat.name
        FROM product
        INNER JOIN category cat
        ON cat.idcategory = product.idcategory
        WHERE cat.idcategory = ?
        AND removed=false
        ORDER BY product.title LIMIT $items_per_page OFFSET $position
        ");
    $stmt->execute(array($idcat));
    return $stmt->fetchAll(PDO::FETCH_OBJ);
}

function getProductsByDep($iddep, $position, $item_per_page) {
    global $conn;
   $stmt = $conn->prepare("SELECT product.idproduct, product.title,
        product.stock, product.price,
        product.img, product.description,
        product.idcategory, cat.name,
        cat.iddepartment, dep.name
        FROM product
        INNER JOIN category cat
        ON cat.idcategory = product.idcategory
        INNER JOIN department dep
        ON dep.iddepartment = cat.iddepartment
        WHERE dep.iddepartment = ?
        AND removed=false
        ORDER BY product.title LIMIT $item_per_page OFFSET $position");
    $stmt->execute(array($iddep));
    return $stmt->fetchAll();
}

function getProdCountByDep($iddep) {
    global $conn;
   $stmt = $conn->prepare("SELECT Count(*) as count
        FROM product
        INNER JOIN category cat
        ON cat.idcategory = product.idcategory
        INNER JOIN department dep
        ON dep.iddepartment = cat.iddepartment
        WHERE dep.iddepartment = ?
        AND removed=false");
    $stmt->execute(array($iddep));
    return $stmt->fetch();
}

//Return a product filters by prod id
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
        cat.iddepartment,
        cat.name as catname,
        dep.name as depname
        FROM product
        INNER JOIN category cat
        ON cat.idcategory = product.idcategory
        INNER JOIN department dep
        ON cat.iddepartment = dep.iddepartment
        WHERE product.idproduct = ?");
        //GROUP BY dep.iddepartment, cat.idcategory, product.idproduct
    $stmt->execute(array($id));
    return $stmt->fetch(PDO::FETCH_ASSOC);
}

function getProductSpecs($id) {
    global $conn;
    $stmt = $conn->prepare("SELECT filter.filter_name as name, prodfilter.type as type, prodfilter.value_int as vint, prodfilter.value_string as vstring
        FROM prodfilter
        INNER JOIN filter
        ON prodfilter.idfilter = filter.idfilter
        WHERE prodfilter.idproduct = ?");
        //GROUP BY dep.iddepartment, cat.idcategory, product.idproduct
    $stmt->execute(array($id));
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

function addProduct($title, $description, $price, $stock, $img, $catid) {
    global $conn;

    $stmt = $conn->prepare("INSERT INTO product(title,description,price,stock,img,idcategory) VALUES (?,?,?,?,?,?)");

    return $stmt->execute(array($title, $description, $price, $stock, $img, $catid));
}

function getWishListProducts($email) {
    global $conn;

    $stmt = $conn->prepare("select product.idproduct,
    product.title, product.description,
    product.price,product.stock,
    product.removed,product.img,
    product.idcategory from product,user_,
    wishlist where user_.email = ?
    AND user_.idUser = wishlist.idUser
    AND product.idProduct = wishlist.idProduct;");
    $stmt->execute(array($email));

    return $stmt->fetchAll(PDO::FETCH_ASSOC);

}

function addProductToWishList($email, $id) {
    global $conn;

    $stmt = $conn->prepare("INSERT INTO wishlist(iduser,idproduct,date_added)
    VALUES ((SELECT user_.iduser from user_ where user_.email = ?),?,null)");

   return $stmt->execute(array($email, $id));
}

function isOnWishList($email, $id) {
    global $conn;

    $stmt = $conn->prepare("SELECT * FROM wishlist,user_ where user_.email = ? AND
    wishlist.iduser = user_.idUser AND wishlist.idProduct = ?");
    $stmt->execute(array($email, $id));
    return $stmt->fetchAll();
}

function purchasedProductBuyer($email, $id) {
    global $conn;

    $stmt = $conn->prepare("SELECT * FROM user_, order_, orderline where user_.email = ? AND
    order_.idbuyer = user_.iduser AND orderline.idorder = order_.idorder AND orderline.idproduct = ?");
    $stmt->execute(array($email, $id));
    return $stmt->fetch();
}

function productReviewdByBuyer($email, $id) {
    global $conn;

    $stmt = $conn->prepare("SELECT review.text, review.rating FROM review, user_, order_ where user_.email = ? AND
    order_.idbuyer = user_.iduser AND order_.idorder = review.idorder AND review.idproduct = ?");
    $stmt->execute(array($email, $id));
    return $stmt->fetch();
}

function averageRatingByProduct($id) {
    global $conn;

    $stmt = $conn->prepare("SELECT AVG(rating) AS average, count(*) AS numreviews FROM review where review.idproduct = ?");
    $stmt->execute(array($id));
    return $stmt->fetch();
}

function reviewsByProduct($id) {
    global $conn;

    $stmt = $conn->prepare("SELECT * FROM review, order_, user_ where review.idproduct = ? AND review.idorder = order_.idorder
            AND order_.idbuyer = user_.iduser");
    $stmt->execute(array($id));
    return $stmt->fetchAll();
}

function removeWishList($email, $id) {
    global $conn;

    $stmt = $conn->prepare("DELETE FROM wishlist WHERE wishlist.idproduct = ?
    AND wishlist.iduser = (select user_.iduser from user_ where email = ?)");
    return $stmt->execute(array($id, $email));

}

function mostOrderedProducts($nr_items) {
    global $conn;
    $stmt = $conn->prepare("SELECT product.*, count(*) as count
                            FROM product
                            INNER JOIN orderline
                            ON product.idproduct = orderline.idproduct
                            WHERE product.removed=false
                            GROUP BY product.idproduct
                            ORDER BY count DESC
                            LIMIT ? OFFSET 0");
    $stmt->execute(array($nr_items));
    return $stmt->fetchAll();
}

//SELECT AVG(rating) AS average, count(*) AS numreviews FROM review where review.idproduct = ?
function mostOrderedProductsbyCat($id, $idproduct_except) {
    global $conn;
    $stmt = $conn->prepare("SELECT product.*, count(*) as count
                            FROM product
                            INNER JOIN orderline
                            ON product.idproduct = orderline.idproduct
                            WHERE product.removed=false
                            AND product.idcategory = ?
                            AND product.idproduct != ?
                            GROUP BY product.idproduct
                            ORDER BY count DESC
                            LIMIT 3 OFFSET 0");
    $stmt->execute(array($id, $idproduct_except));
    return $stmt->fetchAll();
}


function mostOrderedProductsbyCat_Alternative($idcat, $idproduct_except) {
    global $conn;
    $stmt = $conn->prepare("SELECT product.idproduct, product.title,
        product.stock, product.price,
        product.img, product.description,
        product.idcategory, cat.name
        FROM product
        INNER JOIN category cat
        ON cat.idcategory = product.idcategory
        WHERE cat.idcategory = ?
        AND product.idproduct != ?
        AND removed=false
        ORDER BY product.title LIMIT 3 OFFSET 0");
    $stmt->execute(array($idcat, $idproduct_except));
    return $stmt->fetchAll();
}
/*
function mostOrderedProductsbyCat_Complementar($idcat, $idproduct_except1, $idproduct_except2, $idproduct_except3) {
    global $conn;
        $q = "SELECT product.idproduct, product.title,
        product.stock, product.price,
        product.img, product.description,
        product.idcategory, cat.name
        FROM product
        INNER JOIN category cat
        ON cat.idcategory = product.idcategory
        WHERE cat.idcategory = $idcat
        AND product.idproduct != $idproduct_except1";
    if(isset($idproduct_except2))
        $q .= "AND product.idproduct != $idproduct_except2 ";
    if(isset($idproduct_except3))
         $q .= "AND product.idproduct != $idproduct_except3 ";
    $q .= "AND removed=false ORDER BY product.title LIMIT 3 OFFSET 0";
    
    $stmt = $conn->prepare($q);
    $stmt->execute();
    return $stmt->fetchAll();
}

function mostOrderedProductsbyCat_ComplementarWithDep($idcat, $idproduct_except) {
    global $conn;
   $stmt = $conn->prepare("SELECT product.idproduct, product.title,
        product.stock, product.price,
        product.img, product.description,
        product.idcategory, cat.name
        FROM product
        INNER JOIN category cat
        ON cat.idcategory = product.idcategory
        WHERE cat.idcategory = ?
        AND product.idproduct != ?
        AND product.idproduct !=2
        AND product.idproduct != 13
        AND removed=false
        ORDER BY product.title LIMIT 3 OFFSET 0
        ");
    $stmt->execute(array($idcat, $idproduct_except));
    return $stmt->fetchAll();
}*/