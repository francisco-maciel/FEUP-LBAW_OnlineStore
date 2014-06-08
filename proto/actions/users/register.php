<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/users.php');
// TODO variable checks
  if ( !isset($_POST['nif']) ||!isset($_POST['door']) || !isset($_POST['realname']) || !isset($_POST['email']) ||
      !isset($_POST['password']) || !isset($_POST['address']) || !isset($_POST['postcode'])
      || !isset($_POST['city']) || !isset($_POST['phone']) ||
      !isset($_POST['day']) || !isset($_POST['month']) || !isset($_POST['year'])) {

    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/register.php');
    exit;
  }
  $realname = strip_tags($_POST['realname']);
  $email = strip_tags($_POST['email']);
  $password = strip_tags($_POST['password']);
  $address = strip_tags($_POST['address']. " ".$_POST['city']);
  $postcode = strip_tags($_POST['postcode']);
  $city = strip_tags($_POST['city']);
  $phone = strip_tags($_POST['phone']);
  $birthdate = strip_tags($_POST['day']."-".$_POST['month']."-".$_POST['year']) ;
  $door = strip_tags($_POST['door']);
  $nif = strip_tags($_POST['nif']);
var_dump($birthdate);

global $conn;

  try {
       createBuyer($email, $password, $realname, $phone, $birthdate, $address,$door, $postcode, $city, $nif);
}
  catch (PDOException $e) {
      $conn->rollBack();

     if(strpos($e->getMessage(), 'uq_user_email') !== false)  {
        $_SESSION['error_messages'][] = 'Duplicate email';
        $_SESSION['field_errors']['username'] = 'Email already exists';
    }
    else if(strpos($e->getMessage(), 'uq_buyer_nif') !== false) {
        $_SESSION['error_messages'][] = 'Duplicate nif';
        $_SESSION['field_errors']['username'] = 'Nif already exists';
    }
    else  $_SESSION['error_messages'][] = 'Error creating user'. $e->getMessage() ;

      $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL" . 'pages/users/register.php');
    exit;
  }
  $_SESSION['success_messages'][] = 'User registered successfully';
  $_POST['password'] = $password;
  $_POST['login'] = $email;
  $_SERVER['HTTP_REFERER'] = $BASE_URL;
  include($BASE_DIR."actions/users/login.php");
?>
