<?php /* Smarty version Smarty-3.1.15, created on 2014-04-07 16:15:07
         compiled from "C:\Users\Francisco\Documents\lbaw-loja-online\proto\templates\common\menu_logged_out.tpl" */ ?>
<?php /*%%SmartyHeaderCode:278385342cf0b732336-01787854%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '01032e59929228d1fc2dc84333b5588afbf543f8' => 
    array (
      0 => 'C:\\Users\\Francisco\\Documents\\lbaw-loja-online\\proto\\templates\\common\\menu_logged_out.tpl',
      1 => 1396860193,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '278385342cf0b732336-01787854',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5342cf0b73c2a9_25083106',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5342cf0b73c2a9_25083106')) {function content_5342cf0b73c2a9_25083106($_smarty_tpl) {?><a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/users/register.php">Register</a>
<form action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/users/login.php" method="post">
  <input type="text" placeholder="username" name="username">
  <input type="password" placeholder="password" name="password">
  <input type="submit" value=">">
</form>
<?php }} ?>
