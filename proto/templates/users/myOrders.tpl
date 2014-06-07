{include file='common/header.tpl'}

<link rel="stylesheet" href="{$BASE_URL}css/tablefix.css">

<div class="container">
    <h3>My orders</h3>
    <hr>
    <div class="row">
        <div class="panel panel-primary filterable">
            <div class="panel-heading">
                <h3 class="panel-title">Orders</h3>
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
                </div>
            </div>
            <table id="has_context" class="table table-hover">
                <thead>
                <tr class="filters">
                    <th><input type="text" class="form-control" placeholder="Order ID" disabled></th>
                    <th><input type="text" class="form-control" placeholder="State" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Date Placed" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Date Shipped" disabled></th>
                    <th><input type="text" class="form-control" placeholder="Subtotal" disabled></th>
                </tr>
                </thead>
                <tbody>
                    {foreach $myOrders as $myOrder}
                    <tr>
                    <td><a href="{$BASE_URL}pages/users/order.php/?id={$myOrder.idorder}">{$myOrder.idorder}</a></td>
                    <td>{$myOrder.name}</td>
                    <td>{date('Y-m-d H:i:s',strtotime($myOrder.date_placed))}</td>
                    <td>{date('Y-m-d H:i:s',strtotime($myOrder.date_shipped))}</td>
                    <td>€{$myOrder.ordertotal + $myOrder.price}</td>
                    </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </div>
</div>

{if isset($message)}
    <div class="col-sm-12 col-lg-12 col-md-12">
        {if $message != ""}
            <div class="row"></div>
        {/if}
        <h4 style="color:gray">{$message}</h4>
    </div>
{/if}

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="{$BASE_URL}javascript/myOrders.js"></script>
<script src="{$BASE_URL}javascript/contextMenu.js"></script>

{include file='common/footer.tpl'}