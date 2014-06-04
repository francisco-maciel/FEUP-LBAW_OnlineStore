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
                <p>On this page an admin can perform various actions on user management.</p>
                <p>These actions are:</p>
                <ol>
                    <li><a href="#1">Filter users</a></li>
                    <li><a href="#2">View user profile</a></li>
                    <li><a href="#3">Set a user's permission level</a></li>
                    <li><a href="#4">Ban a user</a></li>
                </ol>
                <hr>
                <ol>
                    <li id="1">Filter the results shown</li>
                    <br>
                    <p>Click on <i>Filter</i> button </p>
                    <img src="{$BASE_URL}images/assets/filter_button.png" alt="filter button">
                    <br>
                    <p>And write in the columns headers the value to filter, to note that it is not possible to combine<br>
                        multiple columns to use on table filtering in the current version<br><br>If beside the table title the text
                        <i>(Loading...)</i> is displayed it means the page is still loading information, if the text persists for a<br>
                        long time please refresh the page</p>
                    <br>
                    <li id="2">View a user profile</li>
                    <br>
                    <p>To view a user profile simple click on the user's id on the table (first column and you'll be redirected.)</p>
                    <br>
                    <li id="3">Set a user's permission level</li>
                    <br>
                    <p>To change a user's permission level (demote/promote a user) find the table row representing the user you want <br>
                        and right-click (anywhere on the row) to display a context menu and select the level<br>
                        <br>
                        <img src="{$BASE_URL}images/assets/user_context_menu.png" alt="context menu">
                        <br>
                        <b>NOTE:</b> There is a bug on firefox that will cause the pop-up to automatically disappear after the right-mouse<br>
                        button release, to bypass this hold the right-button and drag the pointer inside the pop-up.</p>
                    <br>
                    <li id="4">Ban user</li>
                    <br>
                    <p>Banning a user means he/she can no longer sign in on the platform. To ban a user open the user's profile
                        <br> with the steps provbided on <i>item #2</i> and at the bottom of the profile there should be a yellow button<br>
                        <img src="{$BASE_URL}images/assets/ban-user-btn.png" alt="ban user button"> (only visible to admins), and clicking on
                        it should display the following modal to confirm the action: </p>
                    <br>
                    <img src="{$BASE_URL}images/assets/modal-ban-user.png" alt="modal confirm ban user">
                    <p>Clicking on <i>Yes, I am</i> will close the modal and ban the user.</p>
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
    <h3>Manage Users <a href="#" data-toggle="modal" data-target=".modal-large" class="glyphicon glyphicon-info-sign"></a> </h3>
    <hr>
    <div class="row">
        <div class="panel panel-primary filterable">
            <div class="panel-heading">
                <h3 class="panel-title">Users</h3>
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
                </div>
            </div>
            <table id="has_context" class="table table-hover">
                <thead>
                    <tr class="filters">
                        <th><input type="text" class="form-control" placeholder="User ID" name="iduser" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Level" name="user_type" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Name" name="name" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Email" name="email" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Banned" name="banned" disabled></th>
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
                <li><a href="#" onclick="loadUsers({$i})">{$i+1}</a></li>
                {/for}
        </ul>
    </div>

</div>

<ul id="contextMenu" class="dropdown-menu" role="menu" style="display:none" >
    <li role="presentation" class="dropdown-header">Set Permission level</li>
    <li class="divider"></li>
    <li><a href="#">Buyer</a></li>
    <li><a href="#">Manager</a></li>

</ul>

<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="{$BASE_URL}javascript/manageUsers.js"></script>
<script src="{$BASE_URL}javascript/contextMenu.js"></script>


{include file='common/footer.tpl'}