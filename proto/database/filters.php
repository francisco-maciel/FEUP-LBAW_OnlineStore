<?php
    
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
     
//name is unique
function getFilterIdByName($name) {
    global $conn;
    $lname = strtolower($name);
    $stmt = $conn->prepare("SELECT idfilter as id FROM filter WHERE LOWER(filter_name)=LOWER('$lname')");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_OBJ);
}
    
function addFilter($name) {
    global $conn;
    $lname = strtolower($name);
    $stmt = $conn->prepare("INSERT INTO filter(filter_name) VALUES('$lname')");
    return $stmt->execute();
}
    
// WARNING: it will fail if name is not unique
function addFilters($name_arr) {
    global $conn;
    $sql = "INSERT INTO filter(filter_name) VALUES";
    foreach ($name_arr as $key => $value) {
        $sql .= "('$value'),";
    }
    $sql_trimmed = substr($sql, 0, -1);
    $stmt = $conn->prepare($sql_trimmed);
    return $stmt->execute();
}
    
//Add one by one and ignore if already present (name must be unique)
function addFilters_failsafe($name_arr) {
    global $conn;
    $base_sql = "INSERT INTO filter(filter_name) VALUES";
        
    foreach ($name_arr as $key => $value) {
        $lvalue = strtolower($value);
        $res = getFilterIdByName($lvalue);
        if (!$res) {
            //Does not exist on db
            $stmt = $conn->prepare($base_sql . "('$lvalue')");
            $stmt->execute();
        }
    }
}
    
// BULK
function getFilterIdsByName_BULK($names_arr) {
    global $conn;
    $sql = "SELECT idfilter AS id, filter_name FROM filter WHERE";
    foreach ($names_arr as $key => $value) {
        $lvalue = strtolower($value);
        $sql .= " filter_name = '$lvalue' OR";
    }
    //rtrim($sql, "OR");
    $sql_trimmed = substr($sql, 0, -2);
    $stmt = $conn->prepare($sql_trimmed);
    $stmt->execute();
    $res = $stmt->fetchAll(PDO::FETCH_ASSOC);
    return $res;
}
    
//-----------------------------------------------------------------------------
// ProdFilter table operations
//-----------------------------------------------------------------------------
    
function addFiltersProduts_Rel($id_product, $filterIds_arr, $types_arr, $values_arr) {
    global $conn;
    $sql = "INSERT INTO prodfilter(idproduct,idfilter,value_string,value_int,type) VALUES";
    for ($index = 0; $index < count($filterIds_arr); $index++) {
        if ($types_arr[$index] == 0) {
            $sql .= "($id_product," . $filterIds_arr[$index]['id'] . ",'$values_arr[$index]',NULL,$types_arr[$index]),";
        } else {
            $sql .= "($id_product," . $filterIds_arr[$index]['id'] . ",NULL,$values_arr[$index],$types_arr[$index]),";
        }
    }
    $sql_trimmed = substr($sql, 0, -1);
    $stmt = $conn->prepare($sql_trimmed);
    return $stmt->execute();
}
    
    
function getFilterValues($id) {
    global $conn;
    $stmt = $conn->prepare('SELECT value_string, value_int, type
                            FROM prodfilter
                            WHERE idfilter=?
                            GROUP BY value_string, value_int, type');
    $stmt->execute(array($id));
    return $stmt->fetchAll(PDO::FETCH_OBJ);
}
    
function getFilteredProductsWithCat($cat, $filters, $position, $items_per_page, $min, $max, $orderby, $order) {
   
   $q = " (select q1.* from ";
            for($i=0; $i < sizeof($filters); $i++) {
                if($i>0)
                    $q .= " INNER JOIN ";
                if($filters[$i]['type'] === 0){
                    $q .= "(select product.* from product INNER JOIN category cat ON cat.idcategory = product.idcategory INNER JOIN prodfilter ON product.idproduct = prodfilter.idproduct WHERE cat.idcategory = ". $cat ." AND product.removed=false AND prodfilter.idfilter = " . $filters[$i]['id'] . " AND prodfilter.value_string = '" . $filters[$i]['value'] . "' ) as q" . ($i+1) . " ";
                } else {
                    $q .= "(select product.* from product INNER JOIN category cat ON cat.idcategory = product.idcategory INNER JOIN prodfilter ON product.idproduct = prodfilter.idproduct WHERE cat.idcategory = ". $cat ." AND product.removed=false AND prodfilter.idfilter = " . $filters[$i]['id'] . " AND prodfilter.value_int = " . $filters[$i]['value'] . " ) as q" . ($i+1) . " ";
                }
                if($i>0)
                    $q .= "ON q1.idproduct = q" . ($i+1) . ".idproduct ";
            }
    $q .= ") ";
    
    $q2 = "select qx.*, count(rating) as nr_reviews, avg(rating) as avgrating from ". $q ." as qx ";
    $q2.= "LEFT JOIN review ON review.idproduct = qx.idproduct
        WHERE qx.price BETWEEN $min AND $max
        GROUP BY qx.idproduct, qx.title, qx.description, qx.price, qx.stock, qx.removed, qx.img, qx.idcategory ";
    
       if($orderby == "product.title")
        $q2.= " ORDER BY qx.title $order ";
    else
        $q2.= " ORDER BY qx.price $order ";
    
    $q2.= " LIMIT $items_per_page OFFSET $position";
    global $conn;
    $stmt = $conn->prepare($q2);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_OBJ);       
}

function getCountFilteredProdsWithCat($cat, $filters, $min, $max) {
   if(sizeof($filters)>0) {
   $q = "select count(q1.*) as count from ";
            for($i=0; $i < sizeof($filters); $i++) {
                if($i>0)
                    $q .= " INNER JOIN ";
                if($filters[$i]['type'] === 0){
                    $q .= "(select product.* from product INNER JOIN category cat ON cat.idcategory = product.idcategory INNER JOIN prodfilter ON product.idproduct = prodfilter.idproduct WHERE cat.idcategory = ". $cat ." AND product.removed=false AND prodfilter.idfilter = " . $filters[$i]['id'] . " AND prodfilter.value_string = '" . $filters[$i]['value'] . "' ) as q" . ($i+1) . " ";
                } else {
                    $q .= "(select product.* from product INNER JOIN category cat ON cat.idcategory = product.idcategory INNER JOIN prodfilter ON product.idproduct = prodfilter.idproduct WHERE cat.idcategory = ". $cat ." AND product.removed=false AND prodfilter.idfilter = " . $filters[$i]['id'] . " AND prodfilter.value_int = " . $filters[$i]['value'] . " ) as q" . ($i+1) . " ";
                }
                if($i>0)
                    $q .= "ON q1.idproduct = q" . ($i+1) . ".idproduct ";
            }
           $q .= "WHERE price BETWEEN $min AND $max";
   }
   else
   {
       $q = "SELECT Count(*) as count
        FROM product
        INNER JOIN category cat
        ON cat.idcategory = product.idcategory
        WHERE cat.idcategory = ?
        AND removed=false
        AND price BETWEEN $min and $max";
   }
    global $conn;
    $stmt = $conn->prepare($q);
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_OBJ);
}
    
function getFilteredProductsWithName($namepart, $filters, $position, $items_per_page, $min, $max, $orderby, $order) {
    $q = "(select q1.* from ";
          for($i=0; $i < sizeof($filters); $i++) {
                if($i>0)
                    $q .= " INNER JOIN ";
                if($filters[$i]['type'] === 0)
                    $q .= "(select product.* from product INNER JOIN prodfilter ON product.idproduct = prodfilter.idproduct WHERE LOWER(product.title) LIKE LOWER('%" . $namepart . "%') AND product.removed=false AND prodfilter.idfilter = " . $filters[$i]['id'] . " AND prodfilter.value_string = '" . $filters[$i]['value'] . "' ) as q" . ($i+1) . " ";
                else 
                    $q .= "(select product.* from product INNER JOIN prodfilter ON product.idproduct = prodfilter.idproduct WHERE LOWER(product.title) LIKE LOWER('%" . $namepart . "%') AND product.removed=false AND prodfilter.idfilter = " . $filters[$i]['id'] . " AND prodfilter.value_int = " . $filters[$i]['value'] . " ) as q" . ($i+1) . " ";
                        
                if($i>0)
                    $q .= "ON q1.idproduct = q" . ($i+1) . ".idproduct ";  
            }
   // $q .= "ORDER BY q1.title LIMIT $items_per_page OFFSET $position";
    
    $q .= ") ";
    
    $q2 = "select qx.*, count(rating) as nr_reviews, avg(rating) as avgrating from ". $q ." as qx ";
    $q2.= "LEFT JOIN review ON review.idproduct = qx.idproduct
        WHERE qx.price BETWEEN $min AND $max
        GROUP BY qx.idproduct, qx.title, qx.description, qx.price, qx.stock, qx.removed, qx.img, qx.idcategory ";
    if($orderby == "product.title")
        $q2.= " ORDER BY qx.title $order ";
    else
        $q2.= " ORDER BY qx.price $order ";
    
      $q2.= " LIMIT $items_per_page OFFSET $position ";
    global $conn;
    $stmt = $conn->prepare($q2);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_OBJ);
}


function getCountFilteredProdsWithName($namepart, $filters, $min, $max) {
   if(sizeof($filters)>0) {
    $q = "select count(q1.*) as count from ";
          for($i=0; $i < sizeof($filters); $i++) {
                if($i>0)
                    $q .= " INNER JOIN ";
                if($filters[$i]['type'] === 0)
                    $q .= "(select product.* from product INNER JOIN prodfilter ON product.idproduct = prodfilter.idproduct WHERE LOWER(product.title) LIKE LOWER('%" . $namepart . "%') AND product.removed=false AND prodfilter.idfilter = " . $filters[$i]['id'] . " AND prodfilter.value_string = '" . $filters[$i]['value'] . "' ) as q" . ($i+1) . " ";
                else 
                    $q .= "(select product.* from product INNER JOIN prodfilter ON product.idproduct = prodfilter.idproduct WHERE LOWER(product.title) LIKE LOWER('%" . $namepart . "%') AND product.removed=false AND prodfilter.idfilter = " . $filters[$i]['id'] . " AND prodfilter.value_int = " . $filters[$i]['value'] . " ) as q" . ($i+1) . " ";
                        
                if($i>0)
                    $q .= "ON q1.idproduct = q" . ($i+1) . ".idproduct ";  
            }
           $q .= "WHERE price BETWEEN $min AND $max";
   }
   else {
       $q = "SELECT Count(*) as count FROM product WHERE LOWER(title) LIKE LOWER('%" . $namepart . "%')
           AND removed=false AND price BETWEEN $min AND $max";
   }
    global $conn;
    $stmt = $conn->prepare($q);
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_OBJ);
}
    
function getSearchFilters($namepart) {
    global $conn;
        
    $stmt = $conn->prepare(" SELECT filter.idfilter as id, filter.filter_name as name
                            FROM filter
                            INNER JOIN prodfilter
                            ON prodfilter.idfilter = filter.idfilter
                            INNER JOIN product
                            ON product.idproduct = prodfilter.idproduct
                            WHERE LOWER(product.title) LIKE LOWER(?)
                            AND product.removed=false
                            GROUP BY id, name
                            ORDER BY name");
    $stmt->execute(array("%" . $namepart . "%"));
    return $stmt->fetchAll();
}