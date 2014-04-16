<?php /* Smarty version Smarty-3.1.15, created on 2014-04-16 12:05:24
         compiled from "C:\Users\Francisco\Documents\lbaw-loja-online\proto\templates\common_proto\homepage.tpl" */ ?>
<?php /*%%SmartyHeaderCode:11893534e701e5d2de6-62349880%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '6d360d33148b3ef1bc49a93c309b3e0da517ef16' => 
    array (
      0 => 'C:\\Users\\Francisco\\Documents\\lbaw-loja-online\\proto\\templates\\common_proto\\homepage.tpl',
      1 => 1397649923,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '11893534e701e5d2de6-62349880',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_534e701e818712_30183676',
  'variables' => 
  array (
    'BASE_URL' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_534e701e818712_30183676')) {function content_534e701e818712_30183676($_smarty_tpl) {?><?php echo $_smarty_tpl->getSubTemplate ('common_proto/header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


<div class="container">

    <div class="row">

        <div class="col-md-3 column margintop20">
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#"><span class="glyphicon "></span> Category </a></li>
                <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span> Category 1</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span> Category 2</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span> Category 3</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span> Category 4</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span> Category 5</a></li>
            </ul>
        </div>

        <div class="col-md-9">

            <div class="row carousel-holder">

                <div class="col-md-12">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item active">
                                <img class="slide-image" src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
images/homepage/img1.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="slide-image" src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
images/homepage/img2.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="slide-image" src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
images/homepage/img3.jpg" alt="">
                            </div>
                        </div>
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>

                </div>

            </div>

            <div class="row">

                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail">
                        <img src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
images/homepage/img5.jpg" alt="">
                        <div class="caption">
                            <h4 class="pull-right">Price €</h4>
                            <h4><a href="shop-item.html">Product A</a>
                            </h4>
                            <p>Description.</p>
                        </div>
                        <div class="ratings">
                            <p class="pull-right">15 reviews</p>
                            <p>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail">
                        <img src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
images/homepage/img6.jpg" alt="">
                        <div class="caption">
                            <h4 class="pull-right">Price €</h4>
                            <h4><a href="shop-item.html">Product B</a>
                            </h4>
                            <p>Description.</p>
                        </div>
                        <div class="ratings">
                            <p class="pull-right">12 reviews</p>
                            <p>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star-empty"></span>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail">
                        <img src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
images/homepage/img7.jpg" alt="">
                        <div class="caption">
                            <h4 class="pull-right">Price €</h4>
                            <h4><a href="shop-item.html">Product C</a>
                            </h4>
                            <p>Description.</p>
                        </div>
                        <div class="ratings">
                            <p class="pull-right">31 reviews</p>
                            <p>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star-empty"></span>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail">
                        <img src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
images/homepage/img8.jpg" alt="">
                        <div class="caption">
                            <h4 class="pull-right">Price €</h4>
                            <h4><a href="shop-item.html">Product D</a>
                            </h4>
                            <p>Description.</p>
                        </div>
                        <div class="ratings">
                            <p class="pull-right">6 reviews</p>
                            <p>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star-empty"></span>
                                <span class="glyphicon glyphicon-star-empty"></span>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail">
                        <img src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
images/homepage/img9.jpg" alt="">
                        <div class="caption">
                            <h4 class="pull-right">Price €</h4>
                            <h4><a href="shop-item.html">Product E</a>
                            </h4>
                            <p>Description.</p>
                        </div>
                        <div class="ratings">
                            <p class="pull-right">18 reviews</p>
                            <p>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star-empty"></span>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4 col-lg-4 col-md-4">
                    <div class="thumbnail">
                        <img src="<?php echo $_smarty_tpl->tpl_vars['BASE_URL']->value;?>
images/homepage/img9.jpg" alt="">
                        <div class="caption">
                            <h4 class="pull-right">Price €</h4>
                            <h4><a href="shop-item.html">Product F</a>
                            </h4>
                            <p>Description.</p>
                        </div>
                        <div class="ratings">
                            <p class="pull-right">18 reviews</p>
                            <p>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star"></span>
                                <span class="glyphicon glyphicon-star-empty"></span>
                            </p>
                        </div>
                    </div>

                </div>

            </div>

        </div>

    </div>
    <!-- /.container -->

</div>
<!-- /.container -->
<?php echo $_smarty_tpl->getSubTemplate ('common_proto/footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>

<?php }} ?>
