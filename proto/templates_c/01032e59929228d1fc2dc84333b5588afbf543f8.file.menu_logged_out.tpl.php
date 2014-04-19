<?php /* Smarty version Smarty-3.1.15, created on 2014-04-19 19:48:22
         compiled from "C:\Users\Francisco\Documents\lbaw-loja-online\proto\templates\common\menu_logged_out.tpl" */ ?>
<?php /*%%SmartyHeaderCode:30885351db66797dc9-54436491%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '01032e59929228d1fc2dc84333b5588afbf543f8' => 
    array (
      0 => 'C:\\Users\\Francisco\\Documents\\lbaw-loja-online\\proto\\templates\\common\\menu_logged_out.tpl',
      1 => 1397936896,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '30885351db66797dc9-54436491',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5351db667afd03_36314960',
  'variables' => 
  array (
    'BASE_URL' => 0,
    'FORM_VALUES' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5351db667afd03_36314960')) {function content_5351db667afd03_36314960($_smarty_tpl) {?><li class="dropdown">
    <a href="http://www.jquery2dotnet.com" class="dropdown-toggle" data-toggle="dropdown">Sign in <b class="caret"></b></a>
    <ul class="dropdown-menu" style="padding: 15px;min-width: 250px;">
        <li>
            <div class="row">
                <div class="col-md-12">
                    <form class="form" role="form" method="post" action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/users/login.php" accept-charset="UTF-8" id="login-nav">
                        <div class="form-group">
                            <label class="sr-only" for="exampleInputEmail2">Email address</label>
                            <?php if (isset($_smarty_tpl->tpl_vars['FORM_VALUES']->value['login'])) {?>
                            <input name="login" type="email" class="form-control" id="exampleInputEmail2" placeholder="Email address" required value="<?php echo $_smarty_tpl->tpl_vars['FORM_VALUES']->value['login'];?>
">
                                <?php } else { ?>
                                <input name="login" type="email" class="form-control" id="exampleInputEmail2" placeholder="Email address" required value="">

                            <?php }?>
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
pages/users/register.php" style="padding:0px"  >
            <input class="btn btn-primary btn-block" type="button" id="" value="Register" >
             </a>
        </li>
    </ul>
</li>
				  <?php }} ?>
