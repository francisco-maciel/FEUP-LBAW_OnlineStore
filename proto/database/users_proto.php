<?php
  
  function createBuyer($email, $password, $realname, $phone, $birthdate , $street,$door,  $postcode , $address, $nif) {
     // TODO add address
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
      //TODO ver tabela buyer
    global $conn;
    $stmt = $conn->prepare("SELECT * 
                            FROM user_
                            WHERE email = ? AND password = ?");
    $stmt->execute(array($email, hash('sha256', $password)));
    return $stmt->fetch() == true;
  }
?>
