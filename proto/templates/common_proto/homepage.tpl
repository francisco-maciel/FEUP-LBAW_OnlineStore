{include file='common_proto/header.tpl'}

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
                                <img class="slide-image" src="{$BASE_URL}images/products/5s.png" alt="">
                            </div>
                            <div class="item">
                                <img class="slide-image" src="{$BASE_URL}images/products/nexus5.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="slide-image" src="{$BASE_URL}images/products/lgg2.jpg" alt="">
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

                {include file='products/list.tpl'}
                
            </div>

        </div>

    </div>
    <!-- /.container -->

</div>
<!-- /.container -->
{include file='common_proto/footer.tpl'}
