{include file='common/header.tpl'}

<link rel="stylesheet" href="{$BASE_URL}css/tablefix.css">

<div class="modal fade modal-large" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="mySmallModalLabel">My Orders Help</h4>
            </div>
            <div class="modal-body">
                <p>On this page a user can perform various actions on user's orders.</p>
                <p>These actions are:</p>
                <ol>
                    <li><a href="#1">Filter orders</a></li>
                    <li><a href="#2">View an order detail</a></li>
                </ol>
                <hr>
                <ol>
                    <li id="1">Filter orders</li>
                    <br>
                    <p>Click on <i>Filter</i> button </p>
                    <img src="{$BASE_URL}images/assets/filter_button.png" alt="filter button">
                    <br>
                    <p>And write in the columns headers the value to filter, to note that it is not possible to combine<br>
                        multiple columns to use on table filtering in the current version<br><br>If beside the table title the text
                        <i>(Loading...)</i> is displayed it means the page is still loading information, if the text persists for a<br>
                        long time please refresh the page</p>
                    <br>
                    <li id="2">View an order detail</li>
                    <br>
                    <p>To view an order detial simply click on the order's id on the table (first column and you'll be redirected.)</p>
                </ol>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <h3>My orders <a href="#" data-toggle="modal" data-target=".modal-large" class="glyphicon glyphicon-info-sign"></a> </h3>
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
                    <td>
                        {if $myOrder.date_shipped != null}
                        {date('Y-m-d H:i:s',strtotime($myOrder.date_shipped))}
                        {/if}
                    </td>
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