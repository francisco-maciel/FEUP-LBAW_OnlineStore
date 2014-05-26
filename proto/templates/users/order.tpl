{include file='common/header.tpl'}

<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <div class="invoice-title">
                <h2>Order Invoice</h2><h3 class="pull-right">Order # {$orderDetail['orderid']}</h3>
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
                        <strong>Payment Method:</strong><br>
                        Visa ending **** 4242<br>
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
                            {foreach $orderLines as $orderLine}
                            <tr>
                                <td><a href="{$BASE_URL}pages/products/product.php/?id={$orderLine.idproduct}">{$orderLine['title']}</a></td>
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