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
function updateProfile($old_email, $email, $realname, $phone, $street, $door, $postcode, $city, $nif) {
    global $conn;

    $sql = 'UPDATE user_ SET email=?, name=?, phone=? WHERE email=?';
    $stmt = $conn->prepare($sql);
    $res = $stmt->execute(array($email, $realname, $phone, $old_email));

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

function getNameByEmail($email) {
    global $conn;
    $stmt = $conn->prepare("SELECT name
                            FROM user_
                            WHERE email = ?");
    $stmt->execute(array($email));
    $result = $stmt->fetch();
    return $result['name'];
}

function getBuyerByEmail($email) {
    global $conn;
    $stmt = $conn->prepare("SELECT * FROM user_, address, buyer WHERE email = ? AND user_.iduser = address.idbuyer AND user_.iduser = buyer.iduser");
    $stmt->execute(array($email));
    return $stmt->fetch();
}

//Excludes admins
function getUsersNoAdmins() {
    global $conn;
    $stmt = $conn->prepare("SELECT iduser, user_type, email, name "
            . "FROM User_ WHERE user_type != 2 "
            . "ORDER BY user_type;");
    $stmt->execute();
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    return $result;
}

function setUserLevel($id, $level) {
    global $conn;
    $stmt = $conn->prepare("UPDATE user_ SET user_type = ? WHERE iduser = ?");
    $result = $stmt->execute(array($level, $id));
    return $result;
}
