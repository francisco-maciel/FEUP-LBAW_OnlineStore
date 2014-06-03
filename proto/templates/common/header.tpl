<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <title>Loja Online - LBAW 2013/14</title>

    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <link rel="stylesheet" href="{$BASE_URL}css/bootstrap.min.css">
    <style>
        body {
            padding-top: 50px;
            padding-bottom: 20px;
        }
    </style>
    <link rel="stylesheet" href="{$BASE_URL}css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="{$BASE_URL}css/main.css">

    <link href="{$BASE_URL}css/shop-homepage.css" rel="stylesheet">
    <link href="{$BASE_URL}css/general.css" rel="stylesheet">
    <link href="{$BASE_URL}css/alertify.core.css" rel="stylesheet">

    <link href="{$BASE_URL}css/alertify.default.css" rel="stylesheet">

    <script src="{$BASE_URL}javascript/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    <script src="{$BASE_URL}javascript/external_libs/alertify.min.js"></script>

</head>


<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>

            </button>
            <a class="navbar-brand" href="{$BASE_URL}">Loja Online</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
                <li><a href="{$BASE_URL}pages/blank.php">About</a>
                </li>
                <li><a href="{$BASE_URL}pages/blank.php">Services</a>
                </li>
                <li><a href="{$BASE_URL}pages/blank.php">Contact</a>
                </li>


            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li>
                    <form class="navbar-form navbar-right" action="{$BASE_URL}pages/products/search-prods.php" method="get">
                        <div class="form-group">
                            {if isset($FORM_VALUES.search)}
                            <input type="text" placeholder="Search" name="search" class="form-control" value = "{$FORM_VALUES.search}">
                            {else}
                                <input type="text" placeholder="Search" name="search" class="form-control" value = "">
                            {/if}
                        </div>
                        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                        <a type="" class="btn btn-danger active"><span class="glyphicon glyphicon-shopping-cart"></span>
                            <span class="badge shopping-cart" >0</span></a>
                    </form>
                </li>

                {if $USERNAME}
                    {if $PERMISSION == 0}
                        {include file='common/menu_logged_in.tpl'}
                    {else}
                        {include file='common/menu_admin_logged.tpl'}
                    {/if}

                {else}
                    {include file='common/menu_logged_out.tpl'}
                {/if}
                {*{else if $USERNAME}

                {else}

                {/if}*}


            </ul>


        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

<div class="container">
    <div class="row">
        {foreach $SUCCESS_MESSAGES as $success}

        <div class="col-md-12 message">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">{$success} </h3>
                    <span class="pull-right clickable message-closer"><i class="glyphicon glyphicon-remove"></i></span>
                </div>

            </div>
        </div>
        {/foreach}

    </div>

    <div class="row" id="error_messages">

        {foreach $ERROR_MESSAGES as $error}
            <div class="col-md-12 message error_message">
                <div class="panel panel-danger">
                    <div class="panel-heading">
                        <h3 class="panel-title">{$error}</h3>
                        <span class="pull-right clickable message-closer"><i class="glyphicon glyphicon-remove"></i></span>
                    </div>

                </div>
            </div>
        {/foreach}

    </div>
</div>
<!-- TODO adicionar field erros
    <div class="row">

        <div class="col-md-12">
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <h3 class="panel-title">Warning1</h3>
                    <span class="pull-right clickable message-closer"><i class="glyphicon glyphicon-remove"></i></span>
                </div>

            </div>
        </div>

    </div>
</div>

-->