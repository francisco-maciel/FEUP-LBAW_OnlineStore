<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/users_proto.php');

  if (!isset($_POST['email']) || !isset($_POST['password'])) {
    $_SESSION['error_messages'][] = 'Invalid login';
    $_SESSION['form_values'] = $_POST;
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
  }

  $username = $_POST['email'];
  $password = $_POST['password'];
  $permission = isLoginCorrect($username, $password);
  if ($permission != Permisson::NONE) {
    $_SESSION['username'] = $username;
      if ($permission == Permisson::BUYER) echo $permission;
    $_SESSION['permission'] = $permission;
    $_SESSION['success_messages'][] = 'Login successful';  
  } else {
    $_SESSION['error_messages'][] = 'Login failed';  
  }
  header('Location: ' . $_SERVER['HTTP_REFERER']);
?>
