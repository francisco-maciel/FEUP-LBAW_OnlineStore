{include file='common/header.tpl'}

<div class="jumbotron jumbotron-sm">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-lg-12">
                <h1 class="h1">
                    Contact us <small>Feel free to contact us</small></h1>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="well well-sm">
                <form id="contact_form" method="post" action="{$BASE_URL}actions/users/contact.php" accept-charset="UTF-8">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter name" required="required" />
                            </div>
                            <div class="form-group">
                                <label for="email">Email Address</label>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required="required" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="subject">Subject</label>
                                <select id="subject" name="subject" class="form-control" required="required">
                                    <option value="na" selected="">Choose One:</option>
                                    <option value="service">General Customer Service</option>
                                    <option value="suggestions">Suggestions</option>
                                    <option value="product">Product Support</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="name">Message</label>
                                <textarea name="message" id="message" class="form-control" rows="9" cols="25" required="required" placeholder="Message"></textarea>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <button type="submit" class="btn btn-primary pull-right" id="btnContactUs">Send Message</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-4">
            <form>
                <legend><span class="glyphicon glyphicon-globe"></span> Our office</legend>
                <address>
                    <strong>Loja Online, Inc.</strong><br>
                    Rua Doutor Roberto Frias s/n, <br>
                    4200-465 Porto<br>
                    <abbr title="Phone">
                        P:</abbr>
                    (351) 123 456 789
                </address>
                <address>
                    <strong>Full Name</strong><br>
                    <a href="mailto:#">general@lojaonline.com</a>
                </address>
            </form>
        </div>
    </div>
</div>

{include file='common/footer.tpl'}
<link rel="stylesheet" href="{$BASE_URL}css/contact.css">