<?php
  include_once '../../config/init.php' ;
  include_once $BASE_DIR .'database/products.php' ;



if (!$_GET['id']) {
    $_SESSION['error_messages'][] = 'Invalid product_id';
    $_SESSION['form_values'] = $_GET;
    if (isset($_SERVER['HTTP_REFERER']))
        header('Location: ' . $_SERVER['HTTP_REFERER']);
    else header('Location: ' . $BASE_URL);
    exit;
  }

  $product = getProductById($_GET['id']);

if (isset($_SESSION['permission'])) {
   if ($_SESSION['permission'] == 1 || $_SESSION['permission'] == 2)
       $smarty->assign('no_cart', true);
}

$specs = getProductSpecs($_GET['id']);


  $otherproducts = mostOrderedProductsbyCat($product['idcategory'],$product['idproduct'] );
  if(sizeof($otherproducts)<3)
        $otherproducts = mostOrderedProductsbyCat_Alternative($product['idcategory'],$product['idproduct']);

  if(sizeof($otherproducts)>0) {
        for($i=0; $i<sizeof($otherproducts);$i++) {
            $otherproductsRatings[$i] = averageRatingByProduct($otherproducts[$i]['idproduct']);
        }

        $smarty->assign('otherproducts', $otherproducts);
        $smarty->assign('otherproductsRatings', $otherproductsRatings);
  }

  $addWishListButton = false;
  if (isset($_SESSION['permission']) && isset($_SESSION['email'])) {

      $addWishListButton = !isOnWishList($_SESSION['email'], $_GET['id']);
      $purchased = purchasedProductBuyer($_SESSION['email'], $_GET['id']);

      $reviewed = productReviewdByBuyer($_SESSION['email'], $_GET['id']);
  }

  $averageRating = averageRatingByProduct($_GET['id']);
  $reviews = reviewsByProduct($_GET['id']);

  $smarty->assign('product', $product);


  $smarty->assign('specs', $specs);

  $smarty->assign('addWishListButton', $addWishListButton);

  $smarty->assign('purchased',isset($purchased)?  $purchased : null);
  $smarty->assign('reviewed', isset($reviewed)?  $reviewed : null);
  $smarty->assign('averageRating', $averageRating);
  $smarty->assign('reviews', $reviews);

// TODO USAR No template


  set_fb_variables($product['title'], $product['description'],$smarty);


  $smarty->display('products/product.tpl');


function set_fb_variables($title, $description,$smarty) {
    $title_length =  strlen($title);
    $crop_value = 256 - $title_length - 72;
    if ($crop_value < 3 ) $croped_description = "";
    else {
        $croped_description = substr($description,0,$crop_value);

    }
    $fb_description = "Shop Online now at http://http://gnomo.fe.up.pt/~lbaw1324/final . ".$croped_description;
    if (strlen($croped_description) != 0 && strlen($fb_description) - 6 > 240 - $title_length) $fb_description = $fb_description."...";

    $smarty->assign('fb_title', $title);
    $smarty->assign('fb_description', $fb_description );
}

?>