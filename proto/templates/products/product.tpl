{include file='common/header.tpl'}
<div id="fb-root"></div>
<script src="{$BASE_URL}javascript/external_libs/facebook_sdk.js">
</script>


<div class="container">

  <div class="row">
<!--
    <div class="col-md-3 column margintop20">
     <ul class="nav nav-pills nav-stacked">
       <li class="active"><a href="#"><span class="glyphicon "></span> Category</a></li>
       <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span> Category 1</a></li>
       <li><a href="#" class="active2"><span class="glyphicon glyphicon-chevron-right"></span> Category 2</a></li>
       <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span> Category 3</a></li>
       <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span> Category 4</a></li>
       <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span> Category 5</a></li>
     </ul>
   </div>

   <div class="col-md-9">
-->

    <div class="thumbnail product_id" id="{$product['idproduct']}">

     <ol class="breadcrumb">
      <li><a href="{$BASE_URL}">Home</a></li>
      <li><a href="{$BASE_URL}pages/products/search-prods.php?dep={$product['iddepartment']}">{$product['depname']}</a></li>
      <li><a href="{$BASE_URL}pages/products/search-prods.php?cat={$product['idcategory']}">{$product['catname']}</a></li>
      <li class="active">{$product['title']}</li>
    </ol>

        {if $product['img'] }
            <img class="img-responsive img-produto" src="{$BASE_URL}images/products/{$product['img']}" alt="">
        {else}
        <img class="img-responsive img-produto" src="{$BASE_URL}images/products/default.png" alt="">
    {/if}

    <div class="caption-full">

        <h4 class="pull-right">€{$product['price']}</h4>
        <h2 class="prodtitle">{$product['title']}</h4>
        <p><strong>Description: </strong>{$product['description']}</p>
        <p><strong>Reference:</strong> {$product['idproduct']}</p>
        <br>
        <h4 class="spectitle">Specifications</h4>
        {foreach $specs as $spec}
            {if $spec['type']==0}
                <p><strong>{$spec.name}:</strong> {$spec.vstring}</p>
            {else}
                <p><strong>{$spec.name}:</strong> {$spec.vint}</p>
            {/if}
        {/foreach}

      <!-- Buttons Add Cart & Share -->
      <div class="text-left">
        <label class="control-label" for=""></label>
        <div class="controls">
            {if $PERMISSION != 0}
                <button onclick="editProduct()" id="" name="" class="btn btn-warning">Edit details <span class="glyphicon glyphicon-edit"></span> </button>
            {else}
                <button id="" name="" class="btn btn-success" onclick="addProductToCart({$product['idproduct']},'{$product['title']}',{$product['price']},'{$product['img']}')">Add to Cart <span class="glyphicon glyphicon-shopping-cart"></span> </button>
                {if $addWishListButton == true}
                    <button id="add_wish_list_button()" name="" class="btn btn-labeled btn-warning" href="">Add to wish-list <span class="glyphicon glyphicon glyphicon-star"></span> </button>
                {else}
                    {if isset($PERMISSION) && $PERMISSION == 0 }
                    <button href="{$BASE_URL}pages/users/wish_list.php" id="wish_list_added" name="" " title="This is item is on your wish list!" class="btn btn-labeled btn-warning" ><span class="glyphicon glyphicon glyphicon-star"></span> </button>
                    {/if}
                {/if}
            {/if}
            
          <!--  Botões partilha FB e twitter -->
          <div class="pull-right">
              <div class="fb-share-button" data-href="http://fe.up.pt/~ei11084/fb_con_lbaw?url={$BASE_URL}pages/products/product.php?id={$product['idproduct']}&title={$fb_title}&description={$fb_description}" data-type="button_count"></div>
            <a href="#" class="btn btn-info"><!-- <i class="icon-twitter"></i>--> Share on Twitter </a>
          </div>
        </div>
      </div>
      <hr>
    </div>
    <div class="ratings">
      <p class="pull-right">3 reviews</p>
      <p>
        <span class="glyphicon glyphicon-star"></span>
        <span class="glyphicon glyphicon-star"></span>
        <span class="glyphicon glyphicon-star"></span>
        <span class="glyphicon glyphicon-star"></span>
        <span class="glyphicon glyphicon-star-empty"></span>
        4.0 stars
      </p>
    </div>
  </div>

  <div class="well">
                <!--
                    <div class="text-right">
                        <a class="btn btn-success">Leave a Review</a>
                    </div>

                    <hr>
                  -->
                  <div class="row">
                    <div class="col-md-12">
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star-empty"></span>
                      User1
                      <span class="pull-right">10 days ago</span>
                      <p>This product was great in terms of quality. I would definitely buy another!</p>
                    </div>
                  </div>

                  <hr>

                  <div class="row">
                    <div class="col-md-12">
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star-empty"></span>
                      User2
                      <span class="pull-right">12 days ago</span>
                      <p>I've alredy ordered another one!</p>
                    </div>
                  </div>

                  <hr>

                  <div class="row">
                    <div class="col-md-12">
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star"></span>
                      <span class="glyphicon glyphicon-star-empty"></span>
                      User3
                      <span class="pull-right">15 days ago</span>
                      <p>I've seen some better than this, but not at this price. I definitely recommend this item.</p>
                    </div>
                  </div>

                </div>

                <div >

                  <hr>
                  <br><br>

                  <h4><a href="#">Other Products</a>
                  </h4>

                  <div class="col-sm-4 col-lg-4 col-md-4">
                   <div class="thumbnail">
                    <img src="http://placehold.it/320x150" alt="">
                    <div class="caption">
                      <h4 class="pull-right">€</h4>
                      <h4><a href="#">Product 1</a>
                      </h4>
                    </div>
                    <div class="ratings">
                      <p class="pull-right">15 reviews</p>
                      <p>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                      </p>
                    </div>
                  </div>
                </div>

                <div class="col-sm-4 col-lg-4 col-md-4">
                  <div class="thumbnail">
                    <img src="http://placehold.it/320x150" alt="">
                    <div class="caption">
                      <h4 class="pull-right">€</h4>
                      <h4><a href="#">Product 2</a>
                      </h4>
                    </div>
                    <div class="ratings">
                      <p class="pull-right">12 reviews</p>
                      <p>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star"></span>
                        <span class="glyphicon glyphicon-star-empty"></span>
                      </p>
                    </div>
                  </div>
                </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">

                            <div class="caption">
                                <h4 class="pull-right">€</h4>
                                <h4><a href="#">Product 3</a>
                                </h4>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">31 reviews</p>

                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>
            </div>




        </div>

    </div>

</div>


            {include file='common/footer.tpl'}

            <script type="text/javascript">

                function editProduct(){
                   //var id = window.location.search;
                   var loc = document.URL.replace("products/product.php", "admin_area/add_product.php");
                   window.location = loc;
                }
            </script>

<script src="{$BASE_URL}javascript/external_libs/alertify.min.js"></script>
<script src="{$BASE_URL}javascript/products/add_wishlist.js"></script>
