<?php

include_once '../../config/init.php';
include_once $BASE_DIR . 'database/users.php';

$buyerid = filter_input(INPUT_GET, 'id');

if (!isset($buyerid)) {
    print_r("Invalid Request params.");
    exit();
}

$res = deleteAccount($buyerid);
include($BASE_DIR."actions/users/logout.php");
print_r(json_encode($res));
