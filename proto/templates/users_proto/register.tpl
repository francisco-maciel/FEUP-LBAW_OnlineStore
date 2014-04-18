{include file='common_proto/header.tpl'}
<!--  TODO already logged in-->
<!--  TODO add birthdate-->

<div class="jumbotron" style="background: #3399FF; color:white">
        <div class="container">
               <h1>Join us now! </h1>
                <h3>Create an account bellow </h3>
           </div>
            </div>
       <div class="container">

           <div class="row">

               <form id="register_form" action="{$BASE_URL}actions/users_proto/register.php" method="post" enctype="multipart/form-data" class="form-horizontal">
                   <fieldset>

                       <!-- Form Name -->
                        <legend>Sign up</legend>
						
                        <!-- Text input-->
                        <div class="form-group"> <!--  TODO add action script-->
                            <label class="col-md-4 control-label" for="user_name">Name</label>  
                            <div class="col-md-6">
                                <input id="user_name" name="realname" type="text" placeholder="Full name" class="form-control input-md" required="" value= "{$FORM_VALUES.realname}">

                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="user_email">Email</label>  
                            <div class="col-md-5">
                                <input id="user_email" name="email" type="email" placeholder="example@mail.com" class="form-control input-md" required="" value="{$FORM_VALUES.email}">

                            </div>
                        </div>

                       <!-- TODO change to dropdown with month | check other values-->
                       <div class="form-group">
                           <label class="col-md-4 control-label" for="user_email">Date of Birth</label>
                           <div class="col-md-1">
                               <input id="" name="day" type="number" placeholder="day"   class="form-control input-md" required="" value="{$FORM_VALUES.day}">
                           </div>
                           <div class="col-md-2">
                               <input id="" name="month" type="number" placeholder="month" class="form-control input-md" required="" value="{$FORM_VALUES.month}">
                           </div>
                           <div class="col-md-3">
                               <input id="" name="year" type="number" placeholder="year" class="form-control input-md" required="" value="{$FORM_VALUES.year}">
                           </div>
                       </div>
						
						<!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="user_password">Password</label>  
                            <div class="col-md-3">
                                <input id="password" name="password" type="password" placeholder="password" class="form-control input-md" required="" value="{$FORM_VALUES.password}">
                            </div>
                        </div>
						
						<!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="user_password">Confirm password</label>
                            <div class="col-md-3">
                                <input id="confirmPassword" name="" type="password" placeholder="confirm your password" class="form-control input-md" required=""  value="">

                            </div>
                        </div>


                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="prod_stock">Address</label>  
                            <div class="col-md-5">
                                <input id="name" name="address" type="text" placeholder="Street name" class="form-control input-md" required=""  value="{$FORM_VALUES.address}">
                            </div>
                            <div class="col-md-2">
                                <input id="city" name="door" type="text" placeholder="Door Number" class="form-control input-md" required=""  value="{$FORM_VALUES.door}">
                            </div>
							 
                        </div>
						
						 <div class="form-group">
                            <label class="col-md-4 control-label" for="prod_stock">Post-code</label>  
                            <div class="col-md-2">
                                <input id="name" name="postcode" type="text" placeholder="Code" class="form-control input-md" required=""  value="{$FORM_VALUES.postcode}">

		
                            </div>
							   <div class="col-md-2">
                                <input id="city" name="city" type="text" placeholder="City" class="form-control input-md" required=""  value="{$FORM_VALUES.city}">
                            </div>
                        </div>
						
						   <div class="form-group">
                            <label class="col-md-4 control-label" for="prod_stock">Contact</label>  
                            <div class="col-md-3">
                                <input id="name" name="phone" type="text" placeholder="Phone number" class="form-control input-md" required=""  value="{$FORM_VALUES.phone}">
                            </div>
							 </div>
                       <div class="form-group">
                           <label class="col-md-4 control-label" for="prod_stock">NIF</label>
                           <div class="col-md-3">
                               <input id="name" name="nif" type="number" pattern="^\d+$" placeholder="NIF" class="form-control input-md" required=""  value="{$FORM_VALUES.nif}">
                           </div>
                       </div>


                       
                        <!-- Button (Double) -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="prod_add_new_row"></label>
                            <div class="col-md-8">
                                <input type="submit"  id="prod_save"  class="btn btn-success" value="Register"></input>
                            </div>
                        </div>


                    </fieldset>
                </form>

            </div>

        </div>
        <!-- /.container -->
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="{$BASE_URL}javascript/register.js"></script>

{include file='common_proto/footer.tpl'}
