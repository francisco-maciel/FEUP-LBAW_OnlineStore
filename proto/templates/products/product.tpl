{include file='common/header.tpl'}
<div id="fb-root"></div>
<script src="{$BASE_URL}javascript/external_libs/facebook_sdk.js">
</script>

<div class="modal fade report-review" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="mySmallModalLabel">Are you sure?</h4>
            </div>
            <div class="modal-body">
                <p>Do you really want to report this review?</p>
            </div>
            <div class="modal-footer">
                <form accept-charset="UTF-8" method="post" action="{$BASE_URL}actions/users/reportReview.php">
                    <input name="reviewID" id="reviewID" type="hidden">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-warning btn-primary">Yes I am</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
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
                <h4 class="prodtitle">{$product['title']}</h4>

                <p><strong>Description: </strong>{$product['description']}</p>
                <p><strong>Reference:</strong> {$product['idproduct']}</p><br>

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
                            <button onclick="editProduct()" id="" name="" class="btn btn-warning">Edit details <span class="glyphicon glyphicon-edit"></span></button>
                        {else}
                            {if $addWishListButton == true}
                                <button id="add_wish_list_button" name="" class="btn btn-labeled btn-warning" href="">Add to wish-list <span class="glyphicon glyphicon glyphicon-heart-empty"></span> </button>
                            {else}
                                {if isset($PERMISSION) && $PERMISSION == 0 }
                                    <button href="{$BASE_URL}pages/users/wish_list.php" id="wish_list_added" name="" " title="This is item is on your wish list!" class="btn btn-labeled btn-warning" ><span class="glyphicon glyphicon glyphicon-heart-empty"></span> </button>
                                {/if}
                            {/if}
                            {if $product['stock'] != 0}
                                <button id="addcart" name="" class="btn btn-success" onclick="addProductToCart({$product['idproduct']},'{$product['title']}',{$product['price']},'{$product['img']}')">Add to Cart <span class="glyphicon glyphicon-shopping-cart"></span> </button>
                            {else}
                                <br/><br/>
                                <p class="""><span class="prodtitle glyphicon glyphicon-exclamation-sign"></span><b class="prodtitle" >This item is out of stock</b></p>
                            {/if}
                            <!--  Se o utilizador tinha comprado o produto -->
                            {if $purchased == true}
                                <!-- Se ja deixou comentario para o produto, pode ver o comentario deixado -->
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
                                {else}    <!-- Se ainda nao tinha deixado comentario, pode deixar comentario -->
                                    <div class="row" style="margin-top:20px;">
                                        <div class="col-md-6">
                                            <div class="text-left">
                                                <a class="btn btn-success btn-green" href="#reviews-anchor" id="open-review-box">Leave a Review</a>
                                            </div>

                                            <div class="row" id="post-review-box" style="display:none;">
                                                <div class="col-md-12">
                                                    <form accept-charset="UTF-8" method="post" action="{$BASE_URL}actions/users/leaveReview.php">
                                                        <input id="ratings-hidden" name="rating" type="hidden">
                                                        <input id="idProduct" name="idProduct" value="{$product['idproduct']}" type="hidden">
                                                        <input id="idOrder" name="idOrder" value="{$purchased['idorder']}" type="hidden">
                                                        <textarea class="form-control animated" cols="50" id="new-review" name="comment" placeholder="Enter your review here..." rows="5"></textarea>

                                                        <div class="text-right">
                                                            <div class="stars starrr" id="rating_value" data-rating="0"></div>
                                                            <a class="btn btn-danger btn-sm" href="#" id="close-review-box" style="display:none; margin-right: 10px;">
                                                                <span class="glyphicon glyphicon-remove"></span>Cancel</a>
                                                            <button type="submit" class="btn btn-success btn-lg">Save</button>
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
                            <div class="fb-share-button" data-href="http://fe.up.pt/~ei11084/fb_con_lbaw?url={$BASE_URL}pages/products/product.php?id={$product['idproduct']}&title={$fb_title}&description={$fb_description}"
                                 data-type="button_count"></div>
                        </div>
                     </div>
                </div>
                <hr>
            </div>

            <div class="ratings">
                <p class="pull-right">{$averageRating['numreviews']} Reviews</p>
                <p>
                    {for $i=1 to intval($averageRating['average'])}
                        <span class="glyphicon glyphicon-star"></span>
                    {/for}
                    {for $i=0 to 4-intval($averageRating['average'])}
                        <span class="glyphicon glyphicon-star-empty"></span>
                    {/for}
                    {round($averageRating['average'],1)}
                </p>
            </div>
        </div>

        <div class="well">
            {if $reviews|@count > 3}
                {for $i=0 to 2}
                    <div class="row">
                        <div class="col-md-12">
                            {for $j=1 to $reviews[$i]['rating']}
                                <span class="glyphicon glyphicon-star"></span>
                            {/for}
                            {for $j=0 to 4-$reviews[$i]['rating']}
                                <span class="glyphicon glyphicon-star-empty"></span>
                            {/for}
                            <span style="padding-left:10px">{$reviews[$i]['name']}</span>
                            <span class="pull-right" style="padding-right:10px;">
                                <button class="btn btn-warning btn-sm report-button" data-toggle="modal" data-target=".report-review" data-id="{$reviews[$i]['idreview']}">Report</button>
                            </span>

                            <p>{$reviews[$i]['text']}</p>
                        </div>
                    </div>
                {/for}
                <div style="text-align: center;">
                    <a id="view_all_comments">click here to view all comments.</a>
                </div>
                <div style="display:none;" id="show_all_comments">
                {for $i=3 to $reviews|@count - 1}
                    <div class="row">
                        <div class="col-md-12">
                            {for $j=1 to $reviews[$i]['rating']}
                                <span class="glyphicon glyphicon-star"></span>
                            {/for}
                            {for $j=0 to 4-$reviews[$i]['rating']}
                                <span class="glyphicon glyphicon-star-empty"></span>
                            {/for}
                            <span style="padding-left:10px">{$reviews[$i]['name']}</span>
                            <span class="pull-right" style="padding-right:10px;">
                                <button class="btn btn-warning btn-sm report-button" data-toggle="modal" data-target=".report-review" data-id="{$reviews[$i]['idreview']}">Report</button>
                            </span>

                            <p>{$reviews[$i]['text']}</p>
                        </div>
                    </div>
                {/for}
                    <div style="text-align: center;">
                        <a id="view_less_comments">click here to view less comments.</a>
                    </div>
                </div>
            {else}
                {foreach $reviews as $review}
                    <div class="row">
                        <div class="col-md-12">
                            {for $j=1 to $review['rating']}
                                <span class="glyphicon glyphicon-star"></span>
                            {/for}
                            {for $j=0 to 4-$review['rating']}
                                <span class="glyphicon glyphicon-star-empty"></span>
                            {/for}
                            <span style="padding-left:10px">{$review['name']}</span>
                            {if $user['user_type'] == 0}
                            <span class="pull-right">
                                <button class="btn btn-warning btn-sm report-button" data-toggle="modal" data-target=".report-review" data-id="{$review['idreview']}">Report</button>
                            </span>
                            {/if}
                            <p>{$review['text']}</p>
                        </div>
                    </div>
                {/foreach}
            {/if}
        </div>

        <hr>

      {if isset($otherproducts)}
        <div> {* OTHER PRODUCTS *}
            <h4>Other Products that may interest you!</h4>
            
            {for $i=0 to (($otherproducts|@count)-1)}
            {$otherprod = $otherproducts[$i]}
            <div class="col-sm-4 col-lg-4 col-md-4">
                <div class="thumbnail">
                    {if $otherprod.img }
                <a href="{$BASE_URL}pages/products/product.php?id={$otherprod.idproduct}"> <img style="min-height:200px; max-height:200px; width:auto;" class="img-responsive" src="{$BASE_URL}images/products/{$otherprod.img}" alt=""> </a>
                {else}
                <a href="{$BASE_URL}pages/products/product.php?id={$otherprod.idproduct}"> <img class="img-responsive" src="{$BASE_URL}images/products/default.png" alt=""> </a>
                {/if}

                    <div class="caption">
                        {if (strlen($otherprod.title)>28)}
                <h4> <a href="{$BASE_URL}pages/products/product.php?id={$otherprod.idproduct}">{substr($otherprod.title,0,28)}</a> </h4>
        {else}
                <h4> <a href="{$BASE_URL}pages/products/product.php?id={$otherprod.idproduct}">{$otherprod.title}</a> </h4>
        {/if}
                <h4 class="pull-right">€{$otherprod.price}</h4>
                    </div>
                    <div class="ratings">
                        <p class="pull-right">{$otherproductsRatings[$i]['numreviews']} reviews</p>
                        <p>
                            {for $x=1 to intval($otherproductsRatings[$i]['average'])}
                            <span class="glyphicon glyphicon-star"></span>
                            {/for}
                            {for $x=0 to 4-intval($otherproductsRatings[$i]['average'])}
                            <span class="glyphicon glyphicon-star-empty"></span>
                            {/for}
                            {if $otherproductsRatings[$i]['average'] > 0 }
                                {round($otherproductsRatings[$i]['average'],1)}
                            {/if}
                        </p>
                    </div>
                </div>
            </div>
        {/for}
            
        </div>
    {/if}
    </div>
</div>

{include file='common/footer.tpl'}

<script type="text/javascript">
    $(document).on("click", "#view_all_comments", function () {
        $(this).css("display", "none");
        $("#show_all_comments").css("display", "initial");
    });

    $(document).on("click", "#view_less_comments", function () {
        $("#view_all_comments").css("display", "initial");
        $("#show_all_comments").css("display", "none");
    });

    $(document).on("click", ".report-button", function () {
        var reviewID = $(this).data('id');
        $(".report-review #reviewID").val(reviewID);
    });

    function editProduct() {
        //var id = window.location.search;
        var loc = document.URL.replace("products/product.php", "admin_area/add_product.php");
        window.location = loc;
    }

    function postReview(idProduct, idOrder) {

        var comment = $('#new-review').val();
        var rating = $('#rating_value .glyphicon-star').length;

        if (comment == null)
            alert("You have to insert your comment!");
        if (rating == 0)
            alert("You must give a rating!");

        alert("Comment: " + comment);
        alert("Rating: " + rating);
    }

</script>

<script src="{$BASE_URL}javascript/external_libs/alertify.min.js"></script>
<script src="{$BASE_URL}javascript/products/add_wishlist.js"></script>
<script src="{$BASE_URL}javascript/users/review.js"></script>
