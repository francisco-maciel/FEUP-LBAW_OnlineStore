<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once('../../config/init.php');

/**
 *
 * @global type $conn
 * @param type $table
 * @param type $field
 * @param type $regex
 * @return type
 */
function contains($table, $field, $regex) {
    global $conn;
    $stmt = $conn->prepare("SELECT * "
            . "FROM $table WHERE $field::varchar(255) ~* $regex");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_OBJ);
}

function containsSubquery($table, $field, $text) {
    global $names;
    $stmt = "SELECT $table." . $names[$table]
            . " FROM $table "
            . "WHERE $table.$field::varchar(255) ~* '$text'";
    return $stmt;
}


function containsSubqueryCount($table, $field, $text) {
    global $names;
    global $conn;
    $stmt = $conn->prepare("SELECT count($table." . $names[$table]
            . ") FROM $table "
            . "WHERE $table.$field::varchar(255) ~* '$text'");
    $stmt->execute();
    return $stmt->fetch();
}
