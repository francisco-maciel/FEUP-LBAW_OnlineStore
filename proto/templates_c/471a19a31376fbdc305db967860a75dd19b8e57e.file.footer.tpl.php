<?php /* Smarty version Smarty-3.1.15, created on 2014-04-14 11:06:07
         compiled from "C:\Users\Francisco\Documents\lbaw-loja-online\proto\templates\common_proto\footer.tpl" */ ?>
<?php /*%%SmartyHeaderCode:28340534bbbd4d21991-08675773%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '471a19a31376fbdc305db967860a75dd19b8e57e' => 
    array (
      0 => 'C:\\Users\\Francisco\\Documents\\lbaw-loja-online\\proto\\templates\\common_proto\\footer.tpl',
      1 => 1397473566,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '28340534bbbd4d21991-08675773',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_534bbbd4d27b19_02441811',
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_534bbbd4d27b19_02441811')) {function content_534bbbd4d27b19_02441811($_smarty_tpl) {?><div class="container">

    <hr>

    <footer>
        <div class="row">
            <div class="col-lg-12">
                <!-- FOOTER  -->

                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="col-md-3">
                                <ul class="list-unstyled">
                                    <li>Loja Online<li>
                                    <li><a href="#">About us</a></li>
                                    <li><a href="#">Contact & support</a></li>
                                    <li><a href="#">Enterprise</a></li>
                                    <li><a href="#">Group</a></li>
                                </ul>
                            </div>
                            <div class="col-md-3">
                                <ul class="list-unstyled">
                                    <li>Help<li>
                                    <li><a href="#">Frequently Asked Questions</a></li>
                                    <li><a href="#">Payment</a></li>
                                    <li><a href="#">Delivery Rates & Policies</a></li>
                                    <li><a href="#">Returns</a></li>
                                    <li><a href="#">Customer Support</a></li>
                                </ul>
                            </div>
                            <div class="col-md-3">
                                <ul class="list-unstyled">
                                    <li>Legal Information<li>
                                    <li><a href="#">General Conditions of Sale</a></li>
                                    <li><a href="#">Privacy Notice</a></li>
                                    <li><a href="#">Security and confidentiality</a></li>
                                    <li><a href="#"> Cookies & Internet Advertising</a></li>
                                </ul>
                            </div>
                            <div class="col-md-3">
                                <ul class="list-unstyled">
                                    <li>Other Services<li>
                                    <li><a href="#">Product Help</a></li>
                                    <li><a href="#">Jobs</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="col-md-8"> <!--
        <a href="#">Terms of Service</a>
        <a href="#">Privacy</a>
        <a href="#">Security</a> -->
                            </div>
                            <div class="col-md-4">
                                <p class="muted pull-right">© 2014 Loja Online. All rights reserved</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- END FOOTER -->
            </div>
        </div>
    </footer>

</div>
<!-- /.container -->

<!-- JavaScript -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
javascript/vendor/jquery-1.10.1.min.js"><\/script>')</script>

<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
javascript/vendor/bootstrap.min.js"></script>

<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
javascript/plugins.js"></script>
<script src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
javascript/main.js"></script>

<script>
    var _gaq = [['_setAccount', 'UA-XXXXX-X'], ['_trackPageview']];
    (function(d, t) {
        var g = d.createElement(t), s = d.getElementsByTagName(t)[0];
        g.src = '//www.google-analytics.com/ga.js';
        s.parentNode.insertBefore(g, s)
    }(document, 'script'));
</script>
<script>
    $(document).ready(function() {
        //Handles menu drop down
        $('.dropdown-menu').find('form').click(function(e) {
            e.stopPropagation();
        });
    });
</script>

</body>

</html>
<?php }} ?>
