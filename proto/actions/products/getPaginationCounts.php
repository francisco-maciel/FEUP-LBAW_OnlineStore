<?php

include_once '../../config/init.php';
include_once $BASE_DIR . 'database/products.php';
    
    $namepart = filter_input(INPUT_GET, 'namepart');
    $dep = filter_input(INPUT_GET, 'dep');
    $cat = filter_input(INPUT_GET, 'cat');
        
    if (isset($namepart))
        $res = getProdCountByName($namepart);
    else if (isset($dep))
        $res = getProdCountByDep($dep);
    else if (isset($cat))
        $res = getProdCountByCat($cat);
            
    print_r(json_encode($res));
?>
