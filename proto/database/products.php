<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



function addProduct($title,$description,$price,$stock){
    global $conn;
    
    $sql = "INSERT INTO product(title,description,price,stock)"
            . "VALUES ($title,$description,$price,$stock)";
    
    return $conn->query($sql);
}

