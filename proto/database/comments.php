<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

include_once $BASE_DIR . 'database/genericDB.php';

function getComments() {
    global $conn;
    $stmt = $conn->prepare('SELECT r.idreview, o.idbuyer, r.reported, r.removed, r.text, r.rating
        FROM proto.review AS r
        INNER JOIN order_ AS o ON
        o.idorder = r.idorder;');
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function setReviewState($idreview, $state) {
    global $conn;
    $stmt = $conn->prepare('UPDATE review SET removed = ?
        WHERE review.idreview = ?;');
    return $stmt->execute(array($state, $idreview));
}

function countComments() {
    global $conn;
    $sql = 'SELECT count(review.idreview) from review;';
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
}

/**
 * Retrive a portion of comments
 *
 * @global type $conn
 * @param type $limit
 * @param type $offset
 * @return type
 */
function getCommentsPortion($limit, $offset) {
    global $conn;
    $stmt = $conn->prepare("SELECT r.idproduct, r.idreview, o.idbuyer, r.reported, r.removed, r.text, r.rating
        FROM proto.review AS r
        INNER JOIN order_ AS o ON
        o.idorder = r.idorder
        ORDER BY r.idreview DESC
        LIMIT $limit OFFSET $offset;");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function saveReview($idProduct, $idOrder, $comment, $rating) {
    global $conn;
    //$conn->beginTransaction();
    $stmt = $conn->prepare('INSERT INTO review VALUES (DEFAULT,?,?,FALSE,?,?,FALSE);');
    return  $stmt->execute(array($rating, $comment, $idOrder, $idProduct));
    //$conn->commit();
}

function reportReview($idReview) {
    global $conn;
    $stmt = $conn->prepare('UPDATE review SET reported = true WHERE idreview = ?');
    return  $stmt->execute(array($idReview));
}

function getCommentsPortionFilter($limit, $offset, $col, $text) {
    global $conn;
    if ($col == "idbuyer") {
        $table = "o";
    } else {
        $table = "review";
    }
    $stmt = $conn->prepare("SELECT r.idproduct, r.idreview, o.idbuyer, r.reported, r.removed, r.text, r.rating "
            . "FROM proto.review AS r "
            . "INNER JOIN order_ AS o ON "
            . "o.idorder = r.idorder "
            . "WHERE r.idreview IN (SELECT review.idreview FROM review "
            . "INNER JOIN order_ AS o ON o.idorder = review.idorder "
            . "WHERE $table.$col::varchar(255) ~* '$text') "
            . "ORDER BY r.idreview DESC "
            . "LIMIT $limit OFFSET $offset;");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}
