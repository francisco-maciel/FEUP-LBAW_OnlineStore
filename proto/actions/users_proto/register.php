<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/users_proto.php');

  if (!isset($_POST['realname']) || !isset($_POST['email']) || !isset($_POST['password']) || !isset($_POST['address']) || !isset($_POST['postcode']) || !isset($_POST['city']) || !isset($_POST['phone'])) {
    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users_proto/register.php');
    exit;
  }

  $realname = strip_tags($_POST['realname']);
  $email = strip_tags($_POST['email']);
  $password = strip_tags($_POST['password']);
  $address = strip_tags($_POST['address'] . " " .$_POST['postcode'] . " ".$_POST['city']);
  $postcode = $_POST['postcode'];
  $city = $_POST['city'];
  $phone = $_POST['phone'];
  $birthdate = "1993-12-03";  // TODO GET VALUES FROM USER
  $door = "30";
  $nif = rand(0,10000);
global $conn;

  try {
      createBuyer($email, $password, $realname, $phone, $birthdate, $address,$door, $postcode, $city, $nif);
  }
  catch (PDOException $e) {
      $conn->rollBack();
    if (strpos($e->getMessage(), 'users_pkey') !== false) {
      $_SESSION['error_messages'][] = 'Duplicate username';
      $_SESSION['field_errors']['username'] = 'Username already exists';
    }
    else if(strpos($e->getMessage(), 'uq_user_email') !== false)  {
        $_SESSION['error_messages'][] = 'Duplicate email';
        $_SESSION['field_errors']['username'] = 'Email already exists';
    }
    else if(strpos($e->getMessage(), 'uq_buyer_nif') !== false) {
        $_SESSION['error_messages'][] = 'Duplicate nif';
        $_SESSION['field_errors']['username'] = 'Nif already exists';
    }
    else  $_SESSION['error_messages'][] = 'Error creating user'. $e->getMessage() ;

      $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users_proto/register.php');
    exit;
  }
  $_SESSION['success_messages'][] = 'User registered successfully';  
  header("Location: $BASE_URL");
?>
