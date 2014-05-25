<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//name is unique
function getFilterIdByName($name) {
    global $conn;
    $stmt = $conn->prepare("SELECT idfilter as id FROM filter WHERE filter_name='$name'");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_OBJ);
}

function addFilter($name) {
    global $conn;
    $stmt = $conn->prepare("INSERT INTO filter(filter_name) VALUES('$name')");
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
        $res = getFilterIdByName($value);
        if (!$res) {
            //Does not exist on db
            $stmt = $conn->prepare($base_sql . "('$value')");
            $stmt->execute();
        }
    }
}

// BULK
function getFilterIdsByName_BULK($names_arr) {
    global $conn;
    $sql = "SELECT idfilter AS id, filter_name FROM filter WHERE";
    foreach ($names_arr as $key => $value) {
        $sql .= " filter_name = '$value' OR";
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
    return $stmt->fetchAll();
}