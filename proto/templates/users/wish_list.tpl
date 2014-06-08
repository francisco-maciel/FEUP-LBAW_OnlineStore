{include file='common/header.tpl'}
<!--  TODO already logged in-->
<div class="container">

    <div class="row" id="content">

        <fieldset>

            <!-- Form Name -->
            <legend> <span class="glyphicon glyphicon-heart-empty"></span> Wish List	</legend>

        </fieldset>
        {include file='products/list.tpl'}

    </div>

</div>

<!-- /.container -->
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="{$BASE_URL}javascript/users/wish_list.js"></script>


<div  style="z-index: 1000000" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content" >

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="mySmallModalLabel">Are you sure you want to remove this product from your wish list?</h4>
            </div>
            <div class="modal-body">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="remove_from_wish_list()">Yes</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>            </div>
        </div>
    </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div>


{include file='common/footer.tpl'}

