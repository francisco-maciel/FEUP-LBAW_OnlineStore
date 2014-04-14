<?php /* Smarty version Smarty-3.1.15, created on 2014-04-14 10:53:47
         compiled from "C:\Users\Francisco\Documents\lbaw-loja-online\proto\templates\users_proto\register.tpl" */ ?>
<?php /*%%SmartyHeaderCode:13254534bbbd4ca9d87-59205678%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8a7d3ab070501c6e44666c37265bd44326b4eb27' => 
    array (
      0 => 'C:\\Users\\Francisco\\Documents\\lbaw-loja-online\\proto\\templates\\users_proto\\register.tpl',
      1 => 1397472817,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '13254534bbbd4ca9d87-59205678',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_534bbbd4ce1cc5_77702948',
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_534bbbd4ce1cc5_77702948')) {function content_534bbbd4ce1cc5_77702948($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('common_proto/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<!--  TODO already logged in-->
<div class="jumbotron" style="background: #3399FF; color:white">
        <div class="container">
               <h1>Join us now! </h1>
                <h3>Create an account bellow </h3>
           </div>
            </div>
       <div class="container">

           <div class="row">

               <form class="form-horizontal">
                   <fieldset>

                       <!-- Form Name -->
                        <legend>Sign up</legend>
						
                        <!-- Text input-->
                        <div class="form-group"> <!--  TODO add action script-->
                            <label class="col-md-4 control-label" for="user_name">Name</label>  
                            <div class="col-md-6">
                                <input id="user_name" name="realname" type="text" placeholder="Full name" class="form-control input-md" required="" value= "">

                            </div>
                        </div>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="user_email">Email</label>  
                            <div class="col-md-5">
                                <input id="user_email" name="email" type="text" placeholder="example@mail.com" class="form-control input-md" required="" value="">

                            </div>
                        </div>
						
						<!-- Text input-->
                        <div class="form-group  has-success">
                            <label class="col-md-4 control-label" for="user_password">Password</label>  
                            <div class="col-md-3">
                                <input id="user_password" name="password" type="password" placeholder="password" class="form-control input-md" required="" value="">
                            </div>
                        </div>
						
						<!-- Text input-->
                        <div class="form-group has-error"><!--  TODO check password -->
                            <label class="col-md-4 control-label" for="user_password">Check password</label>  
                            <div class="col-md-3">
                                <input id="user_password" name="" type="password" placeholder="confirm your password" class="form-control input-md" required="">

                            </div>
                        </div>


                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="prod_stock">Address</label>  
                            <div class="col-md-6">
                                <input id="name" name="address" type="text" placeholder="Street name" class="form-control input-md" required="">
                            </div>
							 
                        </div>
						
						 <div class="form-group">
                            <label class="col-md-4 control-label" for="prod_stock">Post-code</label>  
                            <div class="col-md-2">
                                <input id="name" name="postcode" type="text" placeholder="Code" class="form-control input-md" required="">

		
                            </div>
							   <div class="col-md-2">
                                <input id="city" name="city" type="text" placeholder="City" class="form-control input-md" required="">
                            </div>
                        </div>
						
						   <div class="form-group">
                            <label class="col-md-4 control-label" for="prod_stock">Contact</label>  
                            <div class="col-md-3">
                                <input id="name" name="phone" type="text" placeholder="Phone number" class="form-control input-md" required="">
                            </div>
							 </div>



                       
                        <!-- Button (Double) -->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="prod_add_new_row"></label>
                            <div class="col-md-8">
                                <input type="submit"  id="prod_save" name="prod_save" class="btn btn-success" value="Register"></input>
                            </div>
                        </div>


                    </fieldset>
                </form>

            </div>

        </div>
        <!-- /.container -->

<?php echo $_smarty_tpl->getSubTemplate ('common_proto/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php }} ?>
