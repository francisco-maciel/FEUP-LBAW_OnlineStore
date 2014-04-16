<?php
  session_set_cookie_params(3600, '/'); 
  session_start();

  $BASE_DIR = 'C:\Users\Francisco\Documents\lbaw-loja-online\proto\\';
  $BASE_URL = '/'; //FIXME

  $conn = new PDO('pgsql:host=vdbm.fe.up.pt;port=5432;dbname=lbaw1324', 'lbaw1324', 'zN327sa7');
  $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $conn->exec('SET SCHEMA \'proto\'');

  include_once($BASE_DIR . 'lib\smarty\Smarty.class.php');
  
  $smarty = new Smarty;
  $smarty->template_dir = $BASE_DIR . 'templates\\';
  $smarty->compile_dir = $BASE_DIR . 'templates_c\\';
  $smarty->assign('BASE_URL', $BASE_URL);

  $smarty->assign('ERROR_MESSAGES', array_key_exists('error_messages',$_SESSION) ? $_SESSION['error_messages'] : null);
  $smarty->assign('FIELD_ERRORS', array_key_exists('field_errors',$_SESSION) ? $_SESSION['field_errors']  : null) ;
  $smarty->assign('SUCCESS_MESSAGES', array_key_exists('success_messages',$_SESSION) ? $_SESSION['success_messages'] : null);
  $smarty->assign('FORM_VALUES',array_key_exists('form_values',$_SESSION) ?  $_SESSION['form_values'] : null);
  $smarty->assign('USERNAME', array_key_exists('username',$_SESSION) ? $_SESSION['username'] : null);
  $smarty->assign('PERMISSION', array_key_exists('permission',$_SESSION) ? $_SESSION['permission'] : null);


abstract class Permisson
{
    const NONE = -1;
    const BUYER = 0;
    const MANAGER = 1;
    const ADMIN = 2;

}

  unset($_SESSION['success_messages']);
  unset($_SESSION['error_messages']);  
  unset($_SESSION['field_errors']);
  unset($_SESSION['form_values']);
?>
