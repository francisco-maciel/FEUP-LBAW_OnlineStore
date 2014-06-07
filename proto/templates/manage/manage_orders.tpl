{include file='common/header.tpl'}

<link rel="stylesheet" href="{$BASE_URL}css/tablefix.css">

<div class="modal fade modal-large" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="mySmallModalLabel">Manage Users Help</h4>
            </div>
            <div class="modal-body">
                <p>On this page an admin can perform various actions on order management.</p>
                <p>These actions are:</p>
                <ol>
                    <li><a href="#1">Filter orders</a></li>
                    <li><a href="#2">View order details</a></li>
                    <li><a href="#3">Set a order state</a></li>
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
                    <li id="2">View order details</li>
                    <br>
                    <p>To view a order in more detail simple click on the order's id on the table (first column) and you'll be redirected.</p>
                    <br>
                    <li id="3">Set a order state</li>
                    <br>
                    <p>To change a order state find the table row representing the user you want <br>
                        and right-click (anywhere on the row) to display a context menu and select the state<br>
                        <br>
                        <img src="{$BASE_URL}images/assets/order-context-menu.png" alt="context menu">
                        <br>
                        <b>Note:</b> There is a bug on firefox that will cause the pop-up to automatically disappear after the right-mouse<br>
                        button release, to bypass this hold the right-button and drag the pointer inside the pop-up.</p>
                    <br>
                </ol>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>

            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="container">
    <h3>Manage Orders <a href="#" data-toggle="modal" data-target=".modal-large" class="glyphicon glyphicon-info-sign"></a></h3>
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
                        <th><input type="text" class="form-control" placeholder="Order ID" name="idorder" disabled></th>
                        <th><input type="text" class="form-control" placeholder="State" name="name" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Date Placed" name="date_placed" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Subtotal" name="total" disabled></th>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
        </div>
    </div>

    <div class="row text-center">

        <ul class="pagination">
            {for $i = 0 to $pages}
                <li><a href="#" onclick="loadOrders({$i})">{$i+1}</a></li>
            {/for}
        </ul>
    </div>

</div>



<ul id="contextMenu" class="dropdown-menu" role="menu" style="display:none" >
    <li role="presentation" class="dropdown-header">Set State</li>
    <li class="divider"></li>

</ul>

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="{$BASE_URL}javascript/manageOrders.js"></script>
<script src="{$BASE_URL}javascript/contextMenu.js"></script>


{include file='common/footer.tpl'}