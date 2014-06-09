{include file='common/header.tpl'}
<div id="fb-root"></div>
<script src="{$BASE_URL}javascript/external_libs/facebook_sdk.js">
</script>


<script type="text/javascript">
var perm = '{$PERMISSION}';
var orderDetail = {json_encode($orderDetail)};
var orderLines = {json_encode($orderLines)};
var orderTotal = {json_encode($orderTotal)};

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
                    <a href="{$BASE_URL}pages/products/checkout.php" type="button" class="btn btn-default btn-circle">1</a>
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
                    <span  type="button" class="btn btn-primary btn-circle" >4</span>
                    <p>Confirm</p>
                </div>
            </div>
            <br><br>
        </div>



    </div>

        <div class="row">
            <div class="col-xs-12">
                <div class="invoice-title">
                    <h2>Order Invoice</h2>
                </div>
                <hr>
                <div class="row">
                    <div class="col-xs-6">
                        <address>
                            <strong>Billed To:</strong><br>
                            {$orderDetail['buyername']}<br>
                            {$orderDetail['street']} {$orderDetail['door_nr']}<br>
                            {$orderDetail['postcode']} {$orderDetail['formatted_address']}
                        </address>
                    </div>
                    <div class="col-xs-6 text-right">
                        <address>
                            <strong>Shipped To:</strong><br>
                            {$orderDetail['buyername']}<br>
                            {$orderDetail['street_2']} {$orderDetail['door_nr_2']}<br>
                            {$orderDetail['postcode_2']} {$orderDetail['formatted_address_2']}
                        </address>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-6">
                        <address>
                            <!-- FIXME TODO -->
                            <strong>Payment Data:</strong><br>
                            {$orderDetail['email']}<br>
                            NIF: {$orderDetail['nif']}
                        </address>
                    </div>
                    <div class="col-xs-6 text-right">
                        <address>
                            <strong>Order Date:</strong><br>
                            {$orderDetail['date_placed']}<br><br>
                        </address>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-6">
                        <address>
                            <strong>Transporter:</strong><br>
                            {$orderDetail['transportername']}
                        </address>
                    </div>
                    <div class="col-xs-6 text-right">
                        <address>
                            <strong>Order State:</strong><br>
                            {$orderDetail['orderstate']}<br><br>
                        </address>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><strong>Order summary</strong></h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-condensed">
                                <thead>
                                <tr>
                                    <td><strong>Item</strong></td>
                                    <td class="text-center"><strong>Price</strong></td>
                                    <td class="text-center"><strong>Quantity</strong></td>
                                    <td class="text-right"><strong>Totals</strong></td>
                                </tr>
                                </thead>
                                <tbody>
                                <script>var ite = {count($orderLines)}</script>
                                {foreach $orderLines as $orderLine}
                                <tr>
                                    <td>
                                        <span class="text-info" >{$orderLine['title']}</span>

                        </div>
                        </td>
                        <td class="text-center">{$orderLine['price_per_unit']}</td>
                        <td class="text-center">{$orderLine['quantity']}</td>
                        <td class="text-right">{$orderLine['subtotal']} €</td>
                        </tr>
                        {/foreach}
                        <tr>
                            <td class="thick-line"></td>
                            <td class="thick-line"></td>
                            <td class="thick-line text-center"><strong>Subtotal</strong></td>
                            <td class="thick-line text-right">{$orderTotal['total']} €</td>
                        </tr>
                        <tr>
                            <td class="no-line"></td>
                            <td class="no-line"></td>
                            <td class="no-line text-center"><strong>Shipping</strong></td>
                            <td class="no-line text-right">{$orderDetail['shipping']} €</td>
                        </tr>
                        <tr>
                            <td class="no-line"></td>
                            <td class="no-line"></td>
                            <td class="no-line text-center"><strong>Total</strong></td>
                            <td class="no-line text-right">{$orderTotal['total'] + $orderDetail['shipping']} €</td>
                        </tr>
                        </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div class="row">
    <div id="confirmation">
        <button id="confirm_button_button" onClick="confirmPurchase()" class="col-lg-12 btn btn-block btn-success" ><h3>Confirm purchase</h3></button>
    </div>

</div>

<!-- END PAGAMENTO -->





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
<script>
    $(document).ready(function() {

        var navListItems = $('ul.setup-panel li a'),
                allWells = $('.setup-content');

        allWells.hide();

        navListItems.click(function(e)
        {
            e.preventDefault();
            var $target = $($(this).attr('href')),
                    $item = $(this).closest('li');

            if (!$item.hasClass('disabled')) {
                navListItems.closest('li').removeClass('active');
                $item.addClass('active');
                allWells.hide();
                $target.show();
            }
        });

        $('ul.setup-panel li.active a').trigger('click');

        // DEMO ONLY //
        $('#activate-step-2').on('click', function(e) {
            $('ul.setup-panel li:eq(1)').removeClass('disabled');
            $('ul.setup-panel li a[href="#step-2"]').trigger('click');
            $(this).remove();
        })

    });
    loc = document.URL.replace(/(pages|actions)(\/(.*))*/, '');
    function confirmPurchase() {

        var data = new Object();
        data.orderDetail = orderDetail;
        data.orderLines = orderLines;
        data.orderTotal = orderTotal;

        $('#confirm_button_button').attr("disabled", true);
        $.ajax({
            type: "POST",
            url: '{$BASE_URL}actions/products/purchase.php',
            data: data,
            success: function(response) {
                console.log(response);
                if (response.error) {
                    alertify.alert(response.error);
                    $('#confirm_button_button').attr("disabled", false);
                }

                else {
                    sessionStorage.clear();
                    $('#confirmation').html('');
                    $('#confirmation').append('<a href="'+loc+'pages/users/order.php?id='+response.id+'"><button class="col-lg-12 btn btn-block btn-default" ><h3>View order</h3></button></a>');
                    alertify.alert("Purchase complete!");

                }
            },
            dataType: 'json'
        });

    }


</script>
<link rel="stylesheet" href="{$BASE_URL}css/order.css">
