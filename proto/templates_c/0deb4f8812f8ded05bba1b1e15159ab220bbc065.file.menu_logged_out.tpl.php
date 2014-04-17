<?php /* Smarty version Smarty-3.1.15, created on 2014-04-17 14:03:07
         compiled from "C:\Users\Francisco\Documents\lbaw-loja-online\proto\templates\common_proto\menu_logged_out.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2597534e735f5afee5-91206551%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '0deb4f8812f8ded05bba1b1e15159ab220bbc065' => 
    array (
      0 => 'C:\\Users\\Francisco\\Documents\\lbaw-loja-online\\proto\\templates\\common_proto\\menu_logged_out.tpl',
      1 => 1397743375,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2597534e735f5afee5-91206551',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_534e735f5b57c1_12228705',
  'variables' => 
  array (
    'BASE_URL' => 0,
    'FORM_VALUES' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_534e735f5b57c1_12228705')) {function content_534e735f5b57c1_12228705($_smarty_tpl) {?><li class="dropdown">
    <a href="http://www.jquery2dotnet.com" class="dropdown-toggle" data-toggle="dropdown">Sign in <b class="caret"></b></a>
    <ul class="dropdown-menu" style="padding: 15px;min-width: 250px;">
        <li>
            <div class="row">
                <div class="col-md-12">
                    <form class="form" role="form" method="post" action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/users_proto/login.php" accept-charset="UTF-8" id="login-nav">
                        <div class="form-group">
                            <label class="sr-only" for="exampleInputEmail2">Email address</label>
                            <input name="email" type="email" class="form-control" id="exampleInputEmail2" placeholder="Email address" required value="<?php echo $_smarty_tpl->tpl_vars['FORM_VALUES']->value['email'];?>
">
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="exampleInputPassword2">Password</label>
                            <input name="password" type="password" class="form-control" id="exampleInputPassword2" placeholder="Password" required>
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> Remember me
                            </label>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-success btn-block">Sign in</button>
                        </div>
                    </form>
                </div>
            </div>
        </li>
        <li class="divider"></li>
        <li>
            <a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/users_proto/register.php" style="padding:0px"  >
            <input class="btn btn-primary btn-block" type="button" id="" value="Register" >
             </a>
        </li>
    </ul>
</li>
				  <?php }} ?>
