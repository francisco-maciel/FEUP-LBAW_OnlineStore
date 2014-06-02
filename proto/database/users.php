<?php

function createBuyer($email, $password, $realname, $phone, $birthdate, $street, $door, $postcode, $address, $nif) {
    global $conn;
    $date_signed = date("Y-n-j");

    $conn->beginTransaction();
    $stmt = $conn->prepare('INSERT INTO user_ VALUES (DEFAULT,?,?,?,?,?,?,0);');
    $stmt->execute(array($email, hash('sha256', $password), $realname, $phone, $date_signed, $birthdate));
    $id = $conn->lastInsertId("user__iduser_seq");

    $stmt = $conn->prepare('INSERT INTO buyer VALUES (?,DEFAULT,?);');
    $stmt->execute(array($id, $nif));

    $stmt = $conn->prepare('INSERT INTO address VALUES (DEFAULT,?,?,?,?,?);');
    $stmt->execute(array($street, $door, $postcode, $address, $id));
    $conn->commit();
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function updateProfile($email, $realname, $phone, $birthdate, $street, $door, $postcode, $city, $nif, $id) {
    global $conn;

    $sql = 'UPDATE user_ SET name=?, phone=?, birthdate=? WHERE email=?';
    $stmt = $conn->prepare($sql);
    $res = $stmt->execute(array($realname, $phone, $birthdate, $email));

    $sql = 'UPDATE buyer SET nif=? WHERE iduser=?';
    $stmt = $conn->prepare($sql);
    $res += $stmt->execute(array($nif, $id));

    $sql = 'UPDATE address SET street=?, door_nr=?, postcode=?, formatted_address=? WHERE idbuyer=?';
    $stmt = $conn->prepare($sql);
    $res += $stmt->execute(array($street, $door, $postcode, $city, $id));

    return $res;
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


function changePassword($email, $oldPassword, $newPassword) {
    global $conn;
    $stmt = $conn->prepare("UPDATE user_ SET password=? WHERE email=? AND password=?");
    return $stmt->execute(array(hash('sha256',$newPassword) ,$email, hash('sha256',$oldPassword)));
}

function isLoginCorrect($email, $password) {
    global $conn;
    $stmt = $conn->prepare("SELECT user_type
                            FROM user_
                            WHERE email = ? AND password = ?");
    $stmt->execute(array($email, hash('sha256', $password)));
    $type = $stmt->fetch();
    if ($type) {
        return $type['user_type'];
    } else {
        return Permisson::NONE;
    }
}

function nifExist($nif, $id) {
    global $conn;
    $stmt = $conn->prepare("SELECT nif
                            FROM buyer
                            WHERE nif = ? AND iduser <> ?");
    $stmt->execute(array($nif, $id));
    $exist = $stmt->fetch();
    if ($exist) {
        return true;
    } else {
        return false;
    }
}

function getNameByEmail($email) {
    global $conn;
    $stmt = $conn->prepare("SELECT name
                            FROM user_
                            WHERE email = ?");
    $stmt->execute(array($email));
    $result = $stmt->fetch();
    return $result['name'];
}

function getIdByEmail($email) {
    global $conn;
    $stmt = $conn->prepare("SELECT iduser
                            FROM user_
                            WHERE email = ?");
    $stmt->execute(array($email));
    $result = $stmt->fetch();
    return $result['iduser'];
}

function getBuyerByEmail($email) {
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM user_, address, buyer WHERE email = ? AND user_.iduser = address.idbuyer AND user_.iduser = buyer.iduser");
    $stmt->execute(array($email));
    return $stmt->fetch();
}

function getUserById($id) {
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM user_, address, buyer "
            . "WHERE user_.iduser = $id "
            . "AND user_.iduser = address.idbuyer "
            . "AND user_.iduser = buyer.iduser");
    $stmt->execute();
    return $stmt->fetch();
}

//Excludes admins
function getUsersNoAdmins() {
    global $conn;
    $stmt = $conn->prepare("SELECT user_.iduser, user_.user_type, user_.email, user_.name, buyer.banned "
            . "FROM User_ "
            . "INNER JOIN buyer ON "
            . "user_.iduser = buyer.iduser "
            . "WHERE user_.user_type != 2 "
            . "ORDER BY user_.user_type;");
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    return $result;
}

function deleteAccount($userId) {
    global $conn;
    $stmt = $conn->prepare("UPDATE buyer SET banned = true, nif=999999990 WHERE iduser = $userId");
    $result = $stmt->execute();

    $stmt = $conn->prepare("UPDATE user_ SET name='User Deleted', phone=' ', email=' ', password=' ' WHERE iduser = $userId");
    $result += $stmt->execute();

    $stmt = $conn->prepare("UPDATE address SET street=' ', door_nr=' ', postcode=' ', formatted_address=' ' WHERE idbuyer = $userId");
    $result += $stmt->execute();
    return $result;
}

function banUser($userId) {
    global $conn;
    $stmt = $conn->prepare("UPDATE buyer SET banned = true WHERE iduser = $userId");
    $result = $stmt->execute();
    return $result;
}

function setUserLevel($id, $level) {
    global $conn;
    $stmt = $conn->prepare("UPDATE user_ SET user_type = ? WHERE iduser = ?");
    $result = $stmt->execute(array($level, $id));
    return $result;
}

/**
 * Fecth all users that are not admins limiting the results, retrieving
 * only a portion
 */
function getUsersNoAdminsPortion($limit, $offset) {
    global $conn;
    $stmt = $conn->prepare("SELECT user_.iduser, user_.user_type, user_.email, user_.name, buyer.banned "
            . "FROM User_ "
            . "INNER JOIN buyer ON "
            . "user_.iduser = buyer.iduser "
            . "WHERE user_.user_type != 2 "
            . "ORDER BY user_.date_signed "
            . "OFFSET $offset LIMIT $limit;");
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    return $result;
}

function getUsersPortionFilter($limit, $offset, $col, $text) {
    global $conn;
    if ($col == "banned") {
        $table = "b";
    } else {
        $table = "u";
    }
    $stmt = $conn->prepare("SELECT u.iduser, u.user_type, u.email, u.name, b.banned "
            . "FROM user_ AS u "
            . "INNER JOIN buyer AS b "
            . "ON u.iduser = b.iduser "
            . "WHERE u.iduser IN (SELECT b.iduser FROM buyer AS b "
            . "INNER JOIN user_ AS u "
            . "ON b.iduser = u.iduser "
            . "WHERE $table.$col::varchar(255) ~* '$text') "
            . "AND u.user_type != 2 "
            . "ORDER BY u.date_signed "
            . "OFFSET $offset LIMIT $limit;");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function countBuyers() {
    global $conn;
    $stmt = $conn->prepare("SELECT Count(user_.iduser)
        from user_
        Inner join buyer
        on buyer.iduser = user_.iduser
        where user_type !=2;");
    $stmt->execute();
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    return $result;
}
