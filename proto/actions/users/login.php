<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/users.php');

  if (!isset($_POST['login']) || !isset($_POST['password'])) {
    $_SESSION['error_messages'][] = 'Invalid login';
    $_SESSION['form_values'] = $_POST;
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
  }

  $username = $_POST['login'];
  $password = $_POST['password'];
  $permission = isLoginCorrect($username, $password);
  if ($permission != Permisson::NONE) {
    $_SESSION['username'] = getNameByEmail($username);
    $_SESSION['email'] = $username;

    $_SESSION['permission'] = $permission;
    $_SESSION['success_messages'][] = 'Login successful';  
  } else {
    $_SESSION['error_messages'][] = 'Wrong username or password';
    $_SESSION['form_values'] = $_POST;
  }
  header('Location: ' . $_SERVER['HTTP_REFERER']);
?>