<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function getComments() {
    global $conn;
    $stmt = $conn->prepare('SELECT r.idreview, o.idbuyer, r.reported, r.text, r.rating
        FROM proto.review AS r
        INNER JOIN order_ AS o ON
        o.idorder = r.idorder;');
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function setReviewState($idreview, $state) {
    global $conn;
    $stmt = $conn->prepare('UPDATE review SET reported = ?
        WHERE review.idreview = ?;');
    return $stmt->execute(array($state, $idreview));
}
