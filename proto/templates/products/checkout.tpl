{include file='common/header.tpl'}
<div id="fb-root"></div>
<script src="{$BASE_URL}javascript/external_libs/facebook_sdk.js">
</script>

<script type="text/javascript">
    var all_products =  {json_encode($products)};
</script>

<script type="text/javascript">
var perm = '{$PERMISSION}';
var valid_login = true;
    if (perm == '' || perm != 0) {
        valid_login = false;
    }
</script>
<div class="container">
    <div class="row">

        <div class="stepwizard">
            <div class="stepwizard-row">
                <div class="stepwizard-step">
                    <a href="" type="button" class="btn btn-primary btn-circle">1</a>
                    <p>Shopping cart</p>
                </div>
                <div class="stepwizard-step">
                    <a href="{$BASE_URL}pages/products/address.php" type="button" class="btn btn-default btn-circle">2</a>
                    <p>Address</p>
                </div>
                <div class="stepwizard-step">
                    <a href="{$BASE_URL}pages/products/payment.php" type="button" class="btn btn-default btn-circle">3</a>
                    <p>Payment</p>
                </div>
                <div class="stepwizard-step">
                    <a href="" type="button" class="btn btn-default btn-circle" >4</a>
                    <p>Confirm</p>
                </div>
            </div>
            <br><br>
        </div>
<form id="checkout">
        <!-- SHOPPING CART -->
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-10 col-md-offset-1">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>Product</th>
                            <th>Quantity</th>
                            <th class="text-center">Price</th>
                            <th class="text-center">Total</th>
                            <th> </th>
                        </tr>
                        </thead>
                        <tbody id="cart_table">
                        <tr class="cart_row"> </tr>

                        <tr>
                        <tr>
                            <td>   </td>
                            <td>   </td>
                            <td>   </td>
                            <td><h5>Subtotal</h5></td>
                            <td class="text-right"><h5><strong id="subtotal">€</strong></h5></td>
                        </tr>
                        </tr>
                        <tr>
                            <td>   </td>
                            <td>   </td>
                            <td>   </td>
                            <td><h5>Postage</h5></td>
                            <td class="text-right"><h5><strong id="postage">€</strong></h5></td>
                        </tr>
                        <tr>
                            <td>   </td>
                            <td>   </td>
                            <td>   </td>
                            <td><h3>Total</h3></td>
                            <td class="text-right"><h3><strong id ="total">€</strong></h3></td>
                        </tr>
                        <tr>
                            <td>   </td>
                            <td>   </td>
                            <td>   </td>
                            <td>
                                <a href="{$BASE_URL}pages/homepage.php" >
                                <button type="button" class="btn btn-default">
                                    <span class="glyphicon glyphicon-shopping-cart" ></span> Continue Shopping
                                </button></a></td>
                            <td>
                                <button type="submit" class="btn btn-success">
                                    Checkout <span class="glyphicon glyphicon-play"></span>
                                </button></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- END SHOPPING CART -->
</form>
    </div>


{include file='common/footer.tpl'}

<script type="text/javascript">

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
<script src="{$BASE_URL}javascript/review.js"></script>
<script src="{$BASE_URL}javascript/checkout.js"></script>
