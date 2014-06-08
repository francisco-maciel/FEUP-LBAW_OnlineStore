<?php
  include_once '../../config/init.php';
  include_once $BASE_DIR .'database/users.php';

if (isset( $_SESSION['permission'])) {
    if ($_SESSION['permission'] != -1 ) {
        header('Location: ' . $BASE_URL);
    }
}
  $smarty->display('users/register.tpl');

?>