<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title></title>
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

    <script src="{$BASE_URL}javascript/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
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
                <li><a href="shop-item.html">About</a>
                </li>
                <li><a href="shop-item.html">Services</a>
                </li>
                <li><a href="shop-item.html">Contact</a>
                </li>


            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li>
                    <form class="navbar-form navbar-right">
                        <div class="form-group">
                            <input type="text" placeholder="Search" class="form-control">
                        </div>
                        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                        <button type="submit" class="btn btn-danger active"><span class="glyphicon glyphicon-shopping-cart"></span>
                            <span class="badge shopping-cart" >0</span></button>
                    </form>
                </li>

                {if $USERNAME}
                    {include file='common_proto/menu_logged_in.tpl'}
                {else}
                    {include file='common_proto/menu_logged_out.tpl'}
                {/if}


            </ul>


        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>