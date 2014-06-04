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

function getDepartmentCategoriesSmarty($id) {
    global $conn;
    $stmt = $conn->prepare('SELECT idcategory as id, "name" FROM category WHERE iddepartment=? ORDER BY name');
    $stmt->execute(array($id));
    return $stmt->fetchAll();
}

function getCategoryName($id) {
    global $conn;
    $stmt = $conn->prepare('SELECT name FROM category WHERE idcategory=?');
    $stmt->execute(array($id));
    return $stmt->fetch();
}

function getDepfromCat($id) {
    global $conn;
    $stmt = $conn->prepare('SELECT department.name as name, department.iddepartment as id FROM category, department
                        WHERE category.iddepartment = department.iddepartment AND idcategory=?');
    $stmt->execute(array($id));
    return $stmt->fetch();
}

function addCategory($name, $depid) {
    global $conn;
    $stmt = $conn->prepare("INSERT INTO proto.category(name, iddepartment)
	VALUES ('$name', $depid)");
    return $stmt->execute();
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

function getCatFilters($catid) {
    global $conn;
    $stmt = $conn->prepare("
        SELECT filter.idfilter as id, filter.filter_name as name
        FROM filter
        INNER JOIN CatFilter
        ON catfilter.idfilter = filter.idfilter
        WHERE catFilter.idcategory=?
        GROUP BY filter.idfilter, filter.filter_name
        ORDER BY filter_name");
    $stmt->execute(array($catid));
    return $stmt->fetchAll();
}