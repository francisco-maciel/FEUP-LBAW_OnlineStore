<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function getDepartmentCategories($id) {
    global $conn;
    $stmt = $conn->prepare('SELECT idcategory as id, "name" FROM category WHERE iddepartment=?');
    $stmt->execute(array($id));
    return $stmt->fetchAll(PDO::FETCH_OBJ);
}

//-----------------------------------------------------------------------------
// CatFilter table operations
//-----------------------------------------------------------------------------

function addCatFilter_Rel($cat_id, $filter_ids) {
    global $conn;
    $sql = "INSERT INTO catfilter(idcategory,idfilter) VALUES";
    foreach ($filter_ids as $row) {
        $sql .= "($cat_id," . $row['id'] . "),";
    }
    $sql_trimmed = substr($sql, 0, -1);
    $stmt = $conn->prepare($sql_trimmed);
    return $stmt->execute();
}
