<?php
  include_once('../../config/init.php');
  include_once($BASE_DIR .'database/products.php');
  include_once($BASE_DIR .'database/departments.php');
  include_once($BASE_DIR .'database/categories.php');
  include_once($BASE_DIR .'database/filters.php');

  $items_per_page = 3;
  
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
   
   
    if (isset($_GET['search'])) {
        $namepart = $_GET['search'];
       if($namepart==""){
                $smarty->assign('search',"no_term");
        }
        else
        {
        $products = getProductsByName($namepart,0,$items_per_page);
        $total_rows = getProdCountByName($namepart);
        global $smarty;
       /* if(!empty($products)) {
            $filters = getSearchFilters($namepart);
            $smarty->assign('filters',$filters);
        }*/
        $smarty->assign('search',$namepart);
        $smarty->assign('FORM_VALUES',$_GET);
        $type = "search";
        $value = $namepart;
        }
    }
    elseif(isset($_GET['cat'])) {
        $catid = $_GET['cat'];
        $products = getProductsByCat($catid,0,$items_per_page);
        $total_rows = getProdCountByCat($catid);
        $catname = getCategoryName($catid);
        $smarty->assign('catname',$catname['name']);
        $smarty->assign('cat',$catid);
        $depm = getDepfromCat($catid);
        $smarty->assign('depm',$depm);
        //$filters = getCatFilters($catid);
        //$smarty->assign('filters',$filters);
        $type = "cat";
        $value = $_GET['cat'];
    }
    elseif(isset($_GET['dep'])){
        $depid = $_GET['dep'];
        $products = getProductsByDep($depid,0,$items_per_page);
        $total_rows = getProdCountByDep($depid);
        $dep = getDepartmentName($depid);
        $smarty->assign('dep',$dep['name']);
        $categories = getDepartmentCategoriesSmarty($depid);
        $smarty->assign('categories',$categories);
        $type = "dep";
        $value = $depid;
    }
    else
        $products = getNotRemovedProducts();
       // $smarty->assign('message', 'No items found that match your search');
       

    if (empty($products)) $smarty->assign('message', 'No items found that match your search');
    else  $smarty->assign('message', false);
    
    if(isset($total_rows)){
    $pages = ceil(((int)$total_rows['count'])/$items_per_page);
    $smarty->assign('pages', $pages);
    }
    if(!isset($products))
        $products=[];

    
  $smarty->assign('products', $products);
  $smarty->display('products/search.tpl');
?>

<script type="text/javascript">
    var base_url = "<?php echo $BASE_URL; ?>";
    var type = "<?php echo $type; ?>";
    var value = "<?php echo $value; ?>";
    var items_per_page = "<?php echo $items_per_page; ?>";
    var init_nr_pages = "<?php echo $pages; ?>";
</script>

