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
    foreach ($filter_ids as $filter) {
        $res = findCatFilter($cat_id, $filter['id']);
        if (!$res) {
            $data = TRUE;
            $sql .= "($cat_id," . $filter['id'] . "),";
        }
    }
    if (!$data) {
        return;
    }
    $sql_trimmed = substr($sql, 0, -1);
    $stmt = $conn->prepare($sql_trimmed);
    return $stmt->execute();
}

function findCatFilter($cat_id, $filter_id) {
    global $conn;
    $sql = "SELECT * FROM catfilter
        WHERE idcategory = $cat_id AND
        idfilter = $filter_id";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->fetch();
}
