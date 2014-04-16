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
                                <img class="slide-image" src="{$BASE_URL}images/homepage/img1.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="slide-image" src="{$BASE_URL}images/homepage/img2.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="slide-image" src="{$BASE_URL}images/homepage/img3.jpg" alt="">
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
                        <img src="{$BASE_URL}images/homepage/img5.jpg" alt="">
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
                        <img src="{$BASE_URL}images/homepage/img6.jpg" alt="">
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
                        <img src="{$BASE_URL}images/homepage/img7.jpg" alt="">
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
                        <img src="{$BASE_URL}images/homepage/img8.jpg" alt="">
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
                        <img src="{$BASE_URL}images/homepage/img9.jpg" alt="">
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
                        <img src="{$BASE_URL}images/homepage/img9.jpg" alt="">
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
{include file='common_proto/footer.tpl'}
