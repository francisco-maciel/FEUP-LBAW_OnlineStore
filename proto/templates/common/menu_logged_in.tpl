<li class="dropdown"> <!-- TODO  change if adim, etc -->
    <a href="http://www.jquery2dotnet.com" class="dropdown-toggle" data-toggle="dropdown">Welcome {$USERNAME}<b class="caret"></b></a>
    <ul class="dropdown-menu" role="menu">
        <li role="presentation" class="dropdown-header">User data</li>
        <li><a href="{$BASE_URL}pages/users/profile.php">View/Edit data</a></li>
        <li class="divider"></li>
        <li role="presentation" class="dropdown-header">Profile</li>
        <li><a href="{$BASE_URL}pages/users/wish_list.php">Wish List</a></li>
        <li><a href="#">My orders</a></li>
        <li><a href="{$BASE_URL}actions/users/logout.php">Logout</a></li>
    </ul>
</li>