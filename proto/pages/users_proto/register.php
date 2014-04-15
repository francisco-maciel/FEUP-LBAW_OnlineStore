<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/users_proto.php');
   var_dump($smarty->getVariable("ERROR_MESSAGES"));
  $smarty->display('users_proto/register.tpl');
?>
