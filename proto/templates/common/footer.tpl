<div class="container">

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
                                    <li href="{$BASE_URL}pages/about.php" ><a >About us</a></li>
                                    <li><a href="{$BASE_URL}pages/contact.php">Contact & support</a></li>
                                    <li><a href="http://sigarra.up.pt/feup/pt/web_page.inicial">Enterprise</a></li>
                                    <li><a href="http://lbaw.fe.up.pt/201314/doku.php">Group</a></li>
                                </ul>
                            </div>
                            <div class="col-md-3">
                                <ul class="list-unstyled">
                                    <li >Help<li>
                                    <li><a href="https://developer.paypal.com/">Payment</a></li>
                                    <li><a href="http://www.ctt.pt/fectt/wcmservlet/ctt/particulares/correio/encomendas/encomendas.html">Delivery Rates & Policies</a></li>
                                    <li><a href="{$BASE_URL}pages/contact.php" >Customer Support</a></li>
                                </ul>
                            </div>
                            <div class="col-md-3">
                                <ul class="list-unstyled">
                                    <li>Legal Information<li>
                                    <li><a href="http://www.sha1-online.com/">Security and confidentiality</a></li>
                                    <li><a href="http://www.w3schools.com/html/html5_webstorage.asp"> Cookies & Internet Advertising</a></li>
                                </ul>
                            </div>
                            <div class="col-md-3">
                                <ul class="list-unstyled">
                                    <li>Other Services<li>
                                    <li><a href="{$BASE_URL}pages/about.php" >Product Help</a></li>
                                    <li><a href="http://paginas.fe.up.pt/~firstjob/pt/">Jobs</a></li>
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

    <div style=" display:none; height:90%; " id="cart-panel" class="panel-left">
        <aside class="widget_shopping_cart">
            <h3 style="cursor: pointer" onClick="cartPanel.close()"class=" pull-right glyphicon glyphicon-chevron-left"></h3>
            <h3>Shopping Cart</h3>
            <ul class="cart_list">

            </ul>
            <p class="total"><strong>Subtotal:</strong> <span class="total_amount">€0.00</span></p>
            <p class="buttons">
                <br/>
                <a style="display: none"  class="checkout btn btn-primary btn-md btn-block" href="{$BASE_URL}pages/products/checkout.php">Checkout</a>

                <br/>
                <br/>
                <br/>
                <a class="btn btn-default btn-sm pull-right" onclick="emptyCart()"> <span class="glyphicon glyphicon-trash"></span>Empty</a>

            </p>
        </aside>
    </div>
</div>


<!-- /.container -->

<!-- JavaScript -->

<script>window.jQuery || document.write('<script src="{$BASE_URL}javascript/vendor/jquery-1.10.1.min.js"><\/script>')</script>
<script src="{$BASE_URL}javascript/external_libs/jquery.jpanelmenu.min.js"></script>

<script src="{$BASE_URL}javascript/vendor/bootstrap.min.js"></script>

<script src="{$BASE_URL}javascript/plugins.js"></script>
<script src="{$BASE_URL}javascript/main.js"></script>

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
