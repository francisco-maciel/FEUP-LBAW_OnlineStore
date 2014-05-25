<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/products.php');
  include_once($BASE_DIR .'database/departments.php');
  include_once($BASE_DIR .'database/categories.php');
  include_once($BASE_DIR .'database/filters.php');

/*
if (!$_GET['search']) {
    $_SESSION['error_messages'][] = 'Invalid search';
    $_SESSION['form_values'] = $_GET;
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
  }
  */
  
    $departments = getAllDepartmentsSmarty();
    $smarty->assign('departments', $departments);
   
    //NEW
    if (isset($_GET['search'])) {
        $namepart = $_GET['search'];
        $products = getProductsByName($namepart);
        global $smarty;
        $smarty->assign('FORM_VALUES',$_GET);
    }
    elseif(isset($_GET['cat'])) {
        $products = getProductsByCat($_GET['cat']);
        $catname = getCategoryName($_GET['cat']);
        $cat = $_GET['cat'];
        $smarty->assign('catname',$catname['name']);
        $smarty->assign('cat',$cat);
        $filters = getCatFilters($_GET['cat']);
        for($i=0; $i<sizeof($filters); $i++) {
            $filtervalues[$i] = getFilterValues($filters[$i]['id']);
        }
        $smarty->assign('filtervalues',$filtervalues);
        $smarty->assign('filters',$filters);
    }
    elseif(isset($_GET['dep'])){
        $products = getProductsByDep($_GET['dep']);
        $dep = getDepartmentName($_GET['dep']);
        $smarty->assign('dep',$dep['name']);
        $categories = getDepartmentCategoriesSmarty($_GET['dep']);
        $smarty->assign('categories',$categories);
    }
    else
        $products = getNotRemovedProducts();
    
    if (empty($products)) $smarty->assign('message', 'No items found that match your search');
    else  $smarty->assign('message', false);
    
    
/*
foreach ($tweets as $key => $tweet) {
  unset($photo);
  if (file_exists($BASE_DIR.'images/users/'.$tweet['username'].'.png'))
    $photo = 'images/users/'.$tweet['username'].'.png';
  if (file_exists($BASE_DIR.'images/users/'.$tweet['username'].'.jpg'))
    $photo = 'images/users/'.$tweet['username'].'.jpg';
  if (!$photo) $photo = 'images/assets/default.png';
  $tweets[$key]['photo'] = $photo;
}
*/

  //$smarty->assign('last_tweet_id', $tweets[0]['id']); 
  $smarty->assign('products', $products);
  $smarty->display('products/search.tpl');
?>
