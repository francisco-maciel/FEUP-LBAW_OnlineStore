{include file='common/header.tpl'}

<div class="container">
    <div class="row">
        <div class="stepwizard">
            <div class="stepwizard-row">
                <div class="stepwizard-step">
                    <a href="{$BASE_URL}pages/products/checkout.php" type="button" class="btn btn-default btn-circle">1</a>
                    <p>Shopping cart</p>
                </div>
                <div class="stepwizard-step">
                    <a href="" type="button" class="btn btn-primary btn-circle">2</a>
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

        <!-- LIST OF ADDRESSES -->
        <div class="container" style="width: 80%;">
            <div class="row">
                <h3>Select one shipping address</h3>
                <p>Is the address you'd like to use displayed below? If so, click the corresponding "Deliver to this address" button. Or you can enter a new delivery address.</p>
                <hr>
                {foreach $addresses as $address}
                <div class="col-sm-4 col-lg-4 col-md-4 form-horizontal">
                    <p><h4>{$address['name']}</h4></p>
                    <div>
                        <span>{$address['street']}</span>
                        <span>{$address['door_nr']}</span>
                    </div>
                    <div>
                        <span>{$address['formatted_address']}</span>
                        <span>{$address['postcode']}</span>
                    </div>
                    <p>Portugal<br></p>
                    <p><a href="#" class="btn btn-primary" role="button">Deliver to this address</a> </p>
                </div>
                {/foreach}
            </div>
        </div>
        <!-- END LIST OF ADDRESSES -->
        <hr>
        <!-- ADD NEW ADDRESS -->
        <div class="container" style="width: 82%;">
            <div class="row col-md-8">
                <form id="add_address_form" class="form-horizontal" method="post" action="{$BASE_URL}actions/users/addAddress.php" accept-charset="UTF-8">
                    <fieldset>
                    <!-- Address form -->
                    <h3>Add a new address</h3>
                    Be sure to click "Deliver to this address" when you've finished.
                    <!-- address-street input-->
                    <div class="col-xs-8">
                        <label class="control-label">Street Name:</label>
                        <input type="text" class="form-control" name="street" placeholder="Street Name">
                    </div>
                    <!-- address-door_nr input-->
                    <div class="col-xs-8">
                        <label class="control-label">Door Number:</label>
                        <input type="text" class="form-control" name="door" placeholder="Door Number">
                    </div>
                    <!-- city input-->
                    <div class="col-xs-8">
                        <label class="control-label">City:</label>
                        <input type="text" class="form-control" name="city" placeholder="City">
                    </div>
                    <!-- postal-code input-->
                    <div class="col-xs-8">
                        <label class="control-label">Postcode:</label>
                        <input type="text" class="form-control" name="postcode" placeholder="Postcode">
                    </div>
                    <!-- country select -->
                    <div class="col-xs-8">
                        <label class="control-label">Country:</label>
                        <h4>Portugal</h4>
                    </div>
                    <div class="col-xs-8">
                        <button class="btn btn-primary">Save this address</button>
                    </div>
                    </fieldset>
                </form>
            </div>
        </div>
        <!-- END ADD NEW ADDRESS -->
    </div>
</div>


<!-- JavaScript -->
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.1.min.js"><\/script>')</script>

<script>
    $(document).ready(function(){
        //Handles menu drop down
        $('.dropdown-menu').find('form').click(function (e) {
            e.stopPropagation();
        });
    });
</script>


{include file='common/footer.tpl'}