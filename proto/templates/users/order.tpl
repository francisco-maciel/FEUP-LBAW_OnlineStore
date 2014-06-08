{include file='common/header.tpl'}

<div class="modal fade modal-large" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="mySmallModalLabel">Order Details Help</h4>
            </div>
            <div class="modal-body">
                <p>On this page a user can perform various actions on user's orders.</p>
                <p>These actions are:</p>
                <ol>
                    <li><a href="#1">Check order details</a></li>
                    <li><a href="#2">View a purchased product</a></li>
                </ol>
                <hr>
                <ol>
                    <li id="1">Check order details</li>
                    <br>
                    <p>In this page a user can check all related information about the order. Such as the address shipping to, payment information,
                    transporter information, order states, a list of products purchased and their prices.</p>
                    <br>
                    <li id="2">View a purchased product</li>
                    <br>
                    <p>To view a purchased product simply click on the product's id on the table (first column and you'll be redirected.)</p>
                </ol>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <div class="invoice-title">
                <h2>Order Details <a href="#" data-toggle="modal" data-target=".modal-large" class="glyphicon glyphicon-info-sign"></a> </h2>
                <h3 class="pull-right">Order # {$orderDetail['orderid']}</h3>
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
                        {$orderDetail['street']} {$orderDetail['door_nr']}<br>
                        {$orderDetail['postcode']} {$orderDetail['formatted_address']}
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
                                    <a href="{$BASE_URL}pages/products/product.php/?id={$orderLine.idproduct}">{$orderLine['title']}</a>

                                    </div>
                                </td>
                                <td class="text-center">{$orderLine['price_per_unit']}</td>
                                <td class="text-center">{$orderLine['quantity']}</td>
                                <td class="text-right">{$orderLine['subtotal']}</td>
                            </tr>
                            {/foreach}
                            <tr>
                                <td class="thick-line"></td>
                                <td class="thick-line"></td>
                                <td class="thick-line text-center"><strong>Subtotal</strong></td>
                                <td class="thick-line text-right">{$orderTotal['total']}</td>
                            </tr>
                            <tr>
                                <td class="no-line"></td>
                                <td class="no-line"></td>
                                <td class="no-line text-center"><strong>Shipping</strong></td>
                                <td class="no-line text-right">{$orderDetail['price']}</td>
                            </tr>
                            <tr>
                                <td class="no-line"></td>
                                <td class="no-line"></td>
                                <td class="no-line text-center"><strong>Total</strong></td>
                                <td class="no-line text-right">{$orderTotal['total'] + $orderDetail['price']}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

{include file='common/footer.tpl'}
<link rel="stylesheet" href="{$BASE_URL}css/order.css">
