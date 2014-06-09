{include file='common/header.tpl'}

<div class="modal fade modal-large" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="mySmallModalLabel">User Profile Help</h4>
            </div>
            <div class="modal-body">
                <p>On this page a user can perform various actions on his/her profile.</p>
                <p>These actions are:</p>
                <ol>
                    <li><a href="#1">Check profile details</a></li>
                    <li><a href="#2">Edit profile</a></li>
                    <li><a href="#3">Change password</a></li>
                    <li><a href="#4">Delete account</a></li>
                </ol>
                <hr>
                <ol>
                    <li id="1">Check profile details</li>
                    <br>
                    <p>In this page a user can check all related information about his/her profile. Such as his/her name, email registered,
                    address for shipping, contact, nif information, birthdate.</p>
                    <br>
                    <li id="2">Edit profile</li>
                    <br>
                    <p>To edit the user profile simply click on the "Edit Profile" button, all the user data will be transformed to editable
                    input text fields, the user can change all his/her data besides the email registered, which can not be edited.
                    The user can at any time click on the "Reset" button to reset all the changed. Can also click the "Cancel" button at any time
                    to cancel the edition. And finnly he/she can click on the "Save" button to save the changes.
                    </p>
                    <br>
                    <li id="3">Change password</li>
                    <br>
                    <p>The user can click on the "Change Password" Button to change his/her password. A new form with varias input text fields will
                    apper, and the user is asked to insert his/her original password, a new password and confirm the new password. The user can at
                    any time click the "Cancel" button to cancel the change operation. Finnaly he/she can click on the "Change" button to save the new password.
                    </p>
                    <br>
                    <li id="4">Delete account</li>
                    <br>
                    <p>The user can also delete his/her accout if it's necessary. The user has to click the "Delete Account" button, and then will apear
                    a popup to let the user confirm his/her decision. The user can cancel the delete operation by clicking "Cancel"
                    in this popup. Finnaly click on the "Yes" button will delete the user account, and all the user data will be erased on our database.
                    The user is welcome to come back and register a new account at any time</p>
                </ol>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="mySmallModalLabel">Are you sure?</h4>
            </div>
            <div class="modal-body">
                <p>Banning a user means he/she can no longer log in</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger btn-primary" data-dismiss="modal" onclick="banUser({$user['iduser']})">Yes I am</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade delete-account" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="mySmallModalLabel">Are you sure?</h4>
            </div>
            <div class="modal-body">
                <p>Deleting your account means all you data will be removed form our database, and you can no longer log in</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger btn-primary" data-dismiss="modal" onclick="deleteAccount({$user['iduser']})">Yes I am</button>
            </div>
        </div>
    </div>
</div>

<div class="container" id="profile">
    <div class="row">
        <form id="profile_form" class="form-horizontal" method="post" action="{$BASE_URL}actions/users/editProfile.php" accept-charset="UTF-8">
            <fieldset>
                <legend>Your account <a href="#" data-toggle="modal" data-target=".modal-large" class="glyphicon glyphicon-info-sign"></a> </legend>

                <div class="form-group">
                    <label class="col-sm-4 control-label">Name</label>

                    <div class="col-sm-3">
                        <p class="form-control-update" name="realname">{$user['name']}</p>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label" for="user_email">Email</label>

                    <div class="col-md-5">
                        <p class="" name="email">{$user['email']}</p>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label" for="">Address</label>
                    <div class="col-md-8">
                        <span class="form-control-update" name="street">{$user['street']}</span>
                        <span class="form-control-update" name="door">{$user['door_nr']}</span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label" for="">Post-code</label>
                    <div class="col-md-1">
                        <p class="form-control-update" name="postcode">{$user['postcode']}</p>
                    </div>
                    <div class="col-md-2">
                        <p class="form-control-update" name="city">{$user['formatted_address']}</p>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label" for="">Contact</label>
                    <div class="col-md-3">
                        <p class="form-control-update" name="phone">{$user['phone']}</p>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label" for="">NIF</label>
                    <div class="col-md-3">
                        <p class="form-control-update" name="nif" id="nif">{$user['nif']}</p>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label" for="birth_date">Date of Birth</label>
                    <div class="picker col-md-8" id="birthdate">
                        <p class="form-control-static" name="birthdate" id="birth">{$user['birthdate']}</p>
                    </div>
                    <div class="picker" id="picker" style="display:none"></div>
                </div>

                <div class="form-group" id="form-hide">
                    <label class="col-md-4 control-label" for="prod_stock"></label>
                    <div class="col-md-3">
                        <p class="form-control-hide">Click <a href="{$BASE_URL}pages/users/myOrders.php" style="color:#0033CC">here</a> to view your past purchases </p>
                    </div>
                </div>

                <div class="form-group" id="buttons_hide" style="display:none">
                    <label class="col-md-4 control-label"></label>
                    <div class="col-md-1" id="button-save">
                        <button type="submit" id="save_profile" name="" value="Submit form" class="btn btn-success">Save</button>
                    </div>
                    <div class="col-md-1" id="button-reset">
                        <button type="reset" class="btn btn-info">Reset</button>
                    </div>
                    <div class="col-md-1" id="button-cancel">
                        <a href="{$BASE_URL}pages/users/profile.php" class="btn btn-danger">Cancel</a>
                    </div>
                </div>

            </fieldset>
        </form>
    </div>

    <div class="row">
        <div>
            <label class="col-md-4 control-label"></label>
            <div class="col-md-1" id="button-edit" style="padding-left:1px">
                <button id="edit_profile" name="" class="btn btn-success">Edit profile</button>
            </div>

            {if $PERMISSION == 0}
                <form id="change_password_form" class="form-horizontal" method="post" action="{$BASE_URL}actions/users/changePassword.php" accept-charset="UTF-8">
                    <div class="col-md-5">
                        <a href="#" id="change_password" class="btn btn-default">Change Password</a>

                        <div class="row change_password" style=" display:none">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="user_password">Old Password</label>
                                    <div class="col-md-6">
                                        <input id="oldPassword" name="oldPassword" type="password" placeholder="Old password" class="form-control" required="" value="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="user_password">Password</label>
                                    <div class="col-md-6">
                                        <input id="password" name="password" type="password" placeholder="New password"
                                               class="form-control" required="" value="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="user_password">Confirm password</label>
                                    <div class="col-md-6">
                                        <input id="confirmPassword" name="confirmPassword" type="password" placeholder="Confirm new password" class="form-control" required="" value="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-md-5">
                                        <button type="submit" class="btn btn-success btn-block">Change</button>
                                    </div>
                                    <div class="col-md-5" id="cancel_password">
                                        <button type="reset" class="btn btn-danger btn-block">Cancel</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <div class="col-md-1" style="left:-250px">
                    <button class="btn btn-warning btn-danger" data-toggle="modal" data-target=".delete-account">
                        Delete Account
                    </button>
                </div>
            {else}
                <div class="col-md-1">
                    <button class="btn btn-warning btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">
                        Ban User
                    </button>
                </div>
            {/if}
        </div>
    </div>
</div>

{include file='common/footer.tpl'}

<script src="{$BASE_URL}javascript/users/profile.js"></script>
<script type="text/javascript" src="{$BASE_URL}javascript/external_libs/bday-picker.js"></script>
