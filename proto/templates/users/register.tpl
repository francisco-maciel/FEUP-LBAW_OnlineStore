{include file='common/header.tpl'}
<!--  TODO already logged in-->
<!--  TODO check nif and password standards     -->

<div class="jumbotron" style="background: #3399FF; color:white">
    <div class="container">
        <h1>Join us now! </h1>

        <h3>Create an account bellow </h3>
    </div>
</div>
<div class="container">

    <div class="row">

        <form id="register_form" action="{$BASE_URL}actions/users/register.php" method="post"
              enctype="multipart/form-data" class="form-horizontal">
            <fieldset>

                <!-- Form Name -->
                <legend>Sign up</legend>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="user_name" maxlength="50">Name</label>

                    <div class="col-md-6">
                        <input id="user_name" name="realname" type="text" placeholder="Full name"
                               class="form-control input-md" required="" value="{$FORM_VALUES.realname}">

                    </div>
                </div>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="user_email" maxlength="50">Email</label>

                    <div class="col-md-5">
                        <input id="user_email" name="email" type="email" placeholder="example@mail.com"
                               class="form-control input-md" required="" value="{$FORM_VALUES.email}">

                    </div>
                </div>

                <!-- TODO change to dropdown with month | check other values-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="user_email">Date of Birth</label>

                    <div class="picker" id="picker"></div>

                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="user_password">Password</label>

                    <div class="col-md-3">
                        <input id="password" name="password" type="password" placeholder="password"
                               class="form-control input-md" required="" value="{$FORM_VALUES.password}">
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="user_password">Confirm password</label>

                    <div class="col-md-3">
                        <input id="confirmPassword" name="" type="password" placeholder="confirm your password"
                               class="form-control input-md" required="" value="">

                    </div>
                </div>


                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="prod_stock">Address</label>

                    <div class="col-md-5">
                        <input id="name" name="address" type="text" placeholder="Street name"
                               class="form-control input-md" required="" value="{$FORM_VALUES.address}">
                    </div>
                    <div class="col-md-2">
                        <input id="city" name="door" type="text" placeholder="Door Number" class="form-control input-md"
                               required="" value="{$FORM_VALUES.door}">
                    </div>

                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label" for="prod_stock">Post-code</label>

                    <div class="col-md-2">
                        <input id="name" name="postcode" type="text" placeholder="Code" class="form-control input-md"
                               required="" value="{$FORM_VALUES.postcode}">

                    </div>
                    <div class="col-md-2">
                        <input id="city" name="city" type="text" placeholder="City" class="form-control input-md"
                               required="" value="{$FORM_VALUES.city}">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-md-4 control-label" for="prod_stock">Contact</label>

                    <div class="col-md-3">
                        <input id="contact" name="phone" type="text" maxlength="20" placeholder="Phone number"
                               class="form-control input-md" required="" value="{$FORM_VALUES.phone}">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-md-4 control-label" for="prod_stock">NIF</label>

                    <div class="col-md-3">
                        <input id="nif" name="nif" pattern="^\d+$" placeholder="NIF"
                               title="Por favor insera um NIF válido" class="form-control input-md" required=""
                               value="{$FORM_VALUES.nif}">
                    </div>
                </div>


                <!-- Button (Double) -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="prod_add_new_row"></label>

                    <div class="col-md-8">
                        <input type="submit" id="prod_save" class="btn btn-success" value="Register">
                    </div>
                </div>


            </fieldset>
        </form>

    </div>

</div>
<!-- /.container -->

{include file='common/footer.tpl'}

<script type="text/javascript" src="{$BASE_URL}javascript/external_libs/bday-picker.js"></script>
<script src="{$BASE_URL}javascript/register.js"></script>
<script src="{$BASE_URL}javascript/cart.js" ></script>
