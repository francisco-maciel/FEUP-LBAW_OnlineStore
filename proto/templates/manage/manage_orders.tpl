{include file='common/header.tpl'}

<link rel="stylesheet" href="{$BASE_URL}css/tablefix.css">


<div class="container">
    <h3>Manage Orders</h3>
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