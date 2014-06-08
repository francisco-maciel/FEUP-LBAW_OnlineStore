<?php
    
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
     
include_once '../../config/init.php';
include_once $BASE_DIR . 'database/products.php';
    
    $namepart = filter_input(INPUT_GET, 'namepart');
    $dep = filter_input(INPUT_GET, 'dep');
    $cat = filter_input(INPUT_GET, 'cat');
    $pos = filter_input(INPUT_GET, 'pos');
    $ipp = filter_input(INPUT_GET, 'ipp');
        
    if (isset($namepart))
        $res = getProductsByName($namepart, $pos, $ipp);
    else if (isset($dep))
        $res = getProductsByDep($dep, $pos, $ipp);
    else if (isset($cat))
        $res = getProductsByCat($cat, $pos, $ipp);
            
            
    print_r(json_encode($res));