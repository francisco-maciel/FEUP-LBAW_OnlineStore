<?php
  
  function createBuyer($email, $password, $realname, $phone, $birthdate , $street,$door,  $postcode , $address, $nif) {
    global $conn;
    $date_signed  = date("Y-n-j");

    $conn->beginTransaction();
    $stmt = $conn->prepare('INSERT INTO user_ VALUES (DEFAULT,?,?,?,?,?,?,0);');
    $stmt->execute(array($email,   hash('sha256', $password), $realname,  $phone ,$date_signed,$birthdate));
    $id =  $conn->lastInsertId("user__iduser_seq");

    $stmt = $conn->prepare('INSERT INTO buyer VALUES (?,DEFAULT,?);');
    $stmt->execute(array($id,$nif ));

    $stmt = $conn->prepare('INSERT INTO address VALUES (DEFAULT,?,?,?,?,?);');
    $stmt->execute(array($street,$door, $postcode , $address,  $id ));
    $conn->commit();
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
?>
