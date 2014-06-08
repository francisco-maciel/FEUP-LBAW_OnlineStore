<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function getBuyerAddress($email)
{
    global $conn;
    $stmt = $conn->prepare('SELECT * FROM address, user_ WHERE address.idbuyer = user_.iduser AND user_.email = ?');
    $stmt->execute(array($email));
    return $stmt->fetchAll();
}
/*
function editBuyerAddress($street, $door, $postcode, $city, $iduser)
{
    global $conn;
    $stmt = $conn->prepare('UPDATE address SET street=?, door_nr=?, postcode=?, formatted_address=? WHERE address.idbuyer = ?');
    return $stmt->execute(array($street, $door, $postcode, $city, $iduser));
}
*/
function addBuyerAddress($street, $door, $postcode, $city, $iduser)
{
    global $conn;
    $conn->beginTransaction();
    $stmt = $conn->prepare('INSERT INTO address VALUES (DEFAULT,?,?,?,?,?)');
    $stmt->execute(array($street, $door, $postcode, $city, $iduser));

    $conn->commit();
}
