<?php /* Smarty version Smarty-3.1.15, created on 2014-04-14 10:16:15
         compiled from "C:\Users\Francisco\Documents\lbaw-loja-online\proto\templates\common\menu_logged_in.tpl" */ ?>
<?php /*%%SmartyHeaderCode:21921534bb56f549c14-07020494%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9ced92fe54f9ed26d8c54542bb2046f24bbfd4c7' => 
    array (
      0 => 'C:\\Users\\Francisco\\Documents\\lbaw-loja-online\\proto\\templates\\common\\menu_logged_in.tpl',
      1 => 1396860193,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '21921534bb56f549c14-07020494',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'BASE_URL' => 0,
    'USERNAME' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_534bb56f5e36e3_87559708',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_534bb56f5e36e3_87559708')) {function content_534bb56f5e36e3_87559708($_smarty_tpl) {?><a href="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
actions/users/logout.php">Logout</a>
<span class="username"><?php echo $_smarty_tpl->tpl_vars['USERNAME']->value;?>
</span>
<?php }} ?>
