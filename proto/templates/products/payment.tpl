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
                    <a href="{$BASE_URL}pages/products/checkout.php" type="button" class="btn btn-default btn-circle">1</a>
                    <p>Shopping cart</p>
                </div>
                <div class="stepwizard-step">
                    <a href="{$BASE_URL}pages/products/address.php" type="button" class="btn btn-default btn-circle">2</a>
                    <p>Address</p>
                </div>
                <div class="stepwizard-step">
                    <a href="" type="button" class="btn btn-primary btn-circle">3</a>
                    <p>Payment</p>
                </div>
                <div class="stepwizard-step">
                    <span  type="button" class="btn btn-default btn-circle" >4</span>
                    <p>Confirm</p>
                </div>
            </div>
            <br><br>
        </div>


        <!-- PAGAMENTO -->
        <div class="container">
            <div class="row form-group">
                <div class="col-xs-12">
                    <ul class="nav nav-pills nav-justified thumbnail setup-panel">
                        <li class="active"><a href="#step-1">
                                <h4 class="list-group-item-heading">Bank Transfer</h4>
                                <p class="list-group-item-text">Payment Method</p>
                            </a></li>
                        <li class="default"><a href="#step-2">
                                <h4 class="list-group-item-heading">Credit card</h4>
                                <p class="list-group-item-text">Payment Method</p>
                            </a></li>
                        <li class="default"><a href="#step-3">
                                <h4 class="list-group-item-heading">Paypal™</h4>
                                <p class="list-group-item-text">Payment Method</p>
                            </a></li>
                    </ul>
                </div>
            </div>
            <div class="row setup-content" id="step-2">
                <div class="col-xs-12">
                    <div class="col-md-12 well text-center">
                        <div class="container">
                            <div class='row'>
                                <div class='col-md-4'></div>
                                <div class='col-md-4'>
                                    <script src='https://js.stripe.com/v2/' type='text/javascript'></script>
                                    <form accept-charset="UTF-8" action="/" class="require-validation" data-cc-on-file="false" data-stripe-publishable-key="pk_bQQaTxnaZlzv4FnnuZ28LFHccVSaj" id="payment-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="✓" /><input name="_method" type="hidden" value="PUT" /><input name="authenticity_token" type="hidden" value="qLZ9cScer7ZxqulsUWazw4x3cSEzv899SP/7ThPCOV8=" /></div>
                                        <div class='form-row'>
                                            <div class='col-xs-12 form-group required'>
                                                <label class='control-label'>Name on Card</label>
                                                <input class='form-control' size='4' type='text'>
                                            </div>
                                        </div>
                                        <div class='form-row'>
                                            <div class='col-xs-12 form-group card required'>
                                                <label class='control-label'>Card Number</label>
                                                <input autocomplete='off' class='form-control card-number' size='20' type='text'>
                                            </div>
                                        </div>
                                        <div class='form-row'>
                                            <div class='col-xs-4 form-group cvc required'>
                                                <label class='control-label'>CVC</label>
                                                <input autocomplete='off' class='form-control card-cvc' placeholder='ex. 311' size='4' type='text'>
                                            </div>
                                            <div class='col-xs-4 form-group expiration required'>
                                                <label class='control-label'>Expiration</label>
                                                <input class='form-control card-expiry-month' placeholder='MM' size='2' type='text'>
                                            </div>
                                            <div class='col-xs-4 form-group expiration required'>
                                                <label class='control-label'> </label>
                                                <input class='form-control card-expiry-year' placeholder='YYYY' size='4' type='text'>
                                            </div>
                                        </div>

                                        <div class='form-row'>
                                            <div class='col-md-12 form-group'>
                                                <button class='form-control btn btn-primary' disabled >Pay (method not yet available) </button>
                                            </div>
                                        </div>
                                        <div class='form-row'>
                                            <div class='col-md-12 error form-group hide'>
                                                <div class='alert-danger alert'>
                                                    Please correct the errors and try again.
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class='col-md-4'></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row setup-content" id="step-3">
                <div class="col-xs-12">
                    <div class="col-md-12 well">

                        <h3 class="text-center"> Payment with Paypal™</h3> <hr>
                        <!-- -->

                        <div class="container">
                            <div class='row'>
                                <div class='col-md-4'></div>
                                <div class='col-md-4'>


                                    <div class='form-row'>
                                        <div class='col-md-16'>
                                            <button class='form-control btn btn-primary' disabled >Pay with Paypal™ (method not yet available) </button>

                                        </div>
                                    </div>

                                    <div class='form-row'>
                                        <div class='col-md-12 error form-group hide'>
                                            <div class='alert-danger alert'>
                                                Please correct the errors and try again.
                                            </div>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                                <div class='col-md-4'></div>
                            </div>
                        </div>

                        <!--    -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row setup-content" id="step-1">
        <div class="col-xs-12">
            <div class="col-md-12 well">
                <h5 class="text-center">In order to process the payment of this purchase, please transfer the total amount to the following bank account: </h5>
                <h3 class="text-center"> NIB: 0038 0087 1190 0001 1653 5</h3>
                <h3 class="text-center"> BANK: Online Store Bank</h3> <hr>
                <!-- -->

                <div class="container">
                    <div class='row'>
                        <div class='col-md-4'></div>
                        <div class='col-md-4'>

                            <div class='form-row'>
                                <div class='col-md-12'>
                                    <div class='form-control total btn btn-info'>
                                        Pay by bank transfer
                                    </div>
                                </div>
                            </div>

                            <div class='form-row'>
                                <div class='col-md-12 error form-group hide'>
                                    <div class='alert-danger alert'>
                                        Please correct the errors and try again.
                                    </div>
                                </div>
                            </div>
                            </form>
                        </div>
                        <div class='col-md-4'></div>
                    </div>
                </div>

                <!--    -->
            </div>
        </div>
    </div>
</div>

<!-- END PAGAMENTO -->



</div>



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

</script>