<li class="dropdown">
    <a href="http://www.jquery2dotnet.com" class="dropdown-toggle" data-toggle="dropdown">Welcome {$USERNAME}<b class="caret"></b></a>
    <ul class="dropdown-menu" role="menu">
        {if $PERMISSION == 2}
        <li role="presentation" class="dropdown-header">Users</li>
        <li><a href="{$BASE_URL}pages/admin_area/manage_users.php">Manage Users</a></li>
        <li class="divider"></li>
        {/if}
        <li role="presentation" class="dropdown-header">Store</li>
        <li><a href="{$BASE_URL}pages/admin_area/add_product.php">Add Product</a></li>
        <li><a href="{$BASE_URL}pages/admin_area/manage_orders.php">Manage Orders</a></li>
        <li><a href="{$BASE_URL}pages/admin_area/manage_comments.php">Manage Comments</a></li>
        <li><a href="{$BASE_URL}actions/users/logout.php">Logout</a></li>
    </ul>
</li>