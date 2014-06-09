{include file='common/header.tpl'}

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
                    <span type="button" class="btn btn-primary btn-circle">1</span>

                    <p>Shopping cart</p>
                </div>
                <div class="stepwizard-step">
                    <span type="button" class="btn btn-default btn-circle">2</span>

                    <p>Address</p>
                </div>
                <div class="stepwizard-step">
                    <span type="button" class="btn btn-default btn-circle">3</span>

                    <p>Payment</p>
                </div>
                <div class="stepwizard-step">
                    <span href="" type="button" class="btn btn-default btn-circle">4</span>

                    <p>Confirm</p>
                </div>
            </div>
            <br><br>
        </div>
        <form id="checkout" action="{$BASE_URL}pages/products/address.php">
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
                            <tr class="cart_row"></tr>

                            <tr>
                            <tr>
                                <td>  </td>
                                <td>  </td>
                                <td>  </td>
                                <td><h5>Subtotal</h5></td>
                                <td class="text-right"><h5><strong id="subtotal">€</strong></h5></td>
                            </tr>
                            </tr>
                            <tr>
                                <td>  </td>
                                <td>  </td>
                                <td>  </td>
                                <td><h5>Postage</h5></td>
                                <td class="text-right"><h5><strong id="postage">€</strong></h5></td>
                            </tr>
                            <tr>
                                <td>  </td>
                                <td>  </td>
                                <td>  </td>
                                <td><h3>Total</h3></td>
                                <td class="text-right"><h3><strong id="total">€</strong></h3></td>
                            </tr>
                            <tr>
                                <td>  </td>
                                <td>  </td>
                                <td>  </td>
                                <td>
                                    <a href="{$BASE_URL}pages/homepage.php">
                                        <button type="button" class="btn btn-default">
                                            <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                                        </button>
                                    </a></td>
                                <td>
                                    <button type="submit" class="btn btn-success">
                                        Checkout <span class="glyphicon glyphicon-play"></span>
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- END SHOPPING CART -->
        </form>
    </div>
</div>

{include file='common/footer.tpl'}

<script src="{$BASE_URL}javascript/external_libs/alertify.min.js"></script>
<script src="{$BASE_URL}javascript/cart/checkout.js"></script>
