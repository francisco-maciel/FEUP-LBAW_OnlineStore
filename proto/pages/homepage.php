<?php
  include_once('../config/init.php');
   var_dump($smarty->getVariable("ERROR_MESSAGES"));
    $smarty->display('common_proto/homepage.tpl');
?>
