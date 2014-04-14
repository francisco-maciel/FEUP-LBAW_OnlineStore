<?php /* Smarty version Smarty-3.1.15, created on 2014-04-12 12:35:49
         compiled from "C:\Users\Francisco\Documents\lbaw-loja-online\proto\templates\common\menu_logged_out.tpl" */ ?>
<?php /*%%SmartyHeaderCode:455953493325973622-37900563%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
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
  'nocache_hash' => '455953493325973622-37900563',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5349332597baa2_95166617',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5349332597baa2_95166617')) {function content_5349332597baa2_95166617($_smarty_tpl) {?><a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
pages/users/register.php">Register</a>
<form action="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/users/login.php" method="post">
  <input type="text" placeholder="username" name="username">
  <input type="password" placeholder="password" name="password">
  <input type="submit" value=">">
</form>
<?php }} ?>
