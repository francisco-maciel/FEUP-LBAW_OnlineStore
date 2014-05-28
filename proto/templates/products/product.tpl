{include file='common/header.tpl'}

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
            <img class="img-responsive" src="{$BASE_URL}images/products/{$product['img']}" alt="">
        {else}
        <img class="img-responsive" src="{$BASE_URL}images/products/default.png" alt="">
    {/if}

    <div class="caption-full">

        <h4 class="pull-right">€{$product['price']}</h4>
        <h4><a href="#">{$product['title']}</a>
        </h4>
        <p><strong>Description: </strong>{$product['description']}</p>
        <p><strong>Reference:</strong> {$product['idproduct']}</p>



      <!-- Buttons Add Cart & Share -->
      <div class="text-left">
        <label class="control-label" for=""></label>
        <div class="controls">
            {if $PERMISSION != 0}
                <button onclick="editProduct()" id="" name="" class="btn btn-warning">Edit details <span class="glyphicon glyphicon-edit"></span> </button>
            {else}
                <button id="" name="" class="btn btn-success">Add to Cart <span class="glyphicon glyphicon-shopping-cart"></span> </button>
                {if $addWishListButton == true}
                    <button id="add_wish_list_button" name="" class="btn btn-labeled btn-warning" href="">Add to wish-list <span class="glyphicon glyphicon glyphicon-star"></span> </button>
                {else}
                    {if isset($PERMISSION) && $PERMISSION == 0 }
                    <button href="{$BASE_URL}pages/users/wish_list.php" id="wish_list_added" name="" " title="This is item is on your wish list!" class="btn btn-labeled btn-warning" ><span class="glyphicon glyphicon glyphicon-star"></span> </button>
                    {/if}
                {/if}
                {if $purchased == true}
                    {if $reviewed == true}
                        <div class="row" style="margin-top:20px;">
                            <div class="col-md-6">
                                <div class="text-left">
                                    <a class="btn btn-success btn-green" href="#reviews-anchor" id="open-review-box">View My Review</a>
                                </div>

                                <div class="row" id="post-review-box" style="display:none;">
                                    <div class="col-md-12">
                                        <input id="ratings-hidden" name="rating" type="hidden">
                                        <textarea class="form-control animated" cols="50" id="new-review" name="comment" rows="5" disabled>{$reviewed['text']}</textarea>

                                        <div class="text-right">
                                            {for $i=1 to $reviewed['rating']}
                                                <span class="glyphicon glyphicon-star"></span>
                                            {/for}
                                            {for $i=0 to 4-$reviewed['rating']}
                                                <span class="glyphicon glyphicon-star-empty"></span>
                                            {/for}
                                            <a class="btn btn-danger btn-sm" href="#" id="close-review-box" style="display:none; margin-right: 10px;">
                                            <span class="glyphicon glyphicon-remove"></span>Close</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {else}
                        <div class="row" style="margin-top:20px;">
                            <div class="col-md-6">
                                <div class="text-left">
                                    <a class="btn btn-success btn-green" href="#reviews-anchor" id="open-review-box">Leave a Review</a>
                                </div>

                                <div class="row" id="post-review-box" action="{$BASE_URL}actions/users/leaveReview.php"style="display:none;">
                                    <div class="col-md-12">
                                        <form accept-charset="UTF-8" action="" method="post">
                                            <input id="ratings-hidden" name="rating" type="hidden">
                                            <textarea class="form-control animated" cols="50" id="new-review" name="comment"
                                                      placeholder="Enter your review here..." rows="5"></textarea>

                                            <div class="text-right">
                                                <div class="stars starrr" data-rating="0"></div>
                                                <a class="btn btn-danger btn-sm" href="#" id="close-review-box"
                                                   style="display:none; margin-right: 10px;">
                                                    <span class="glyphicon glyphicon-remove"></span>Cancel</a>
                                                <button class="btn btn-success btn-lg" type="submit">Save</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/if}
                {/if}
            {/if}
            
          <!--  Botões partilha FB e twitter -->
          <div class="pull-right">
            
            <a href="#" class="btn btn-primary"><!--<i class="icon-facebook"></i>--> Share on Facebook </a>
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

            </div>

            <div>

                <hr>
                <br><br>

                <h4><a href="#">Other Products</a>
                </h4>

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
<script src="{$BASE_URL}javascript/review.js"></script>