<?php
  
  function createUser($email, $password, $realname, $phone, $birthdate) {
    global $conn;
    $date_signed  = date("Y-n-j");
    $stmt = $conn->prepare("INSERT INTO user_ VALUES (DEFAULT,?,?,?,?,$date_signed,?,0);
");
    $stmt->execute(array($email, $password, $realname,  hash('sha256', $password),$phone,$birthdate));
  }

  function isLoginCorrect($email, $password) {
    global $conn;
    $stmt = $conn->prepare("SELECT * 
                            FROM user_
                            WHERE email = ? AND password = ?");
    $stmt->execute(array($email, hash('sha256', $password)));
    return $stmt->fetch() == true;
  }
?>
