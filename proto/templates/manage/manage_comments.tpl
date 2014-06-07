{include file='common/header.tpl'}

<link rel="stylesheet" href="{$BASE_URL}css/tablefix.css">

<div class="container">
    <h3>Manage Comments</h3>
    <hr>
    <div class="row">
        <div class="panel panel-primary filterable">
            <div class="panel-heading">
                <h3 class="panel-title">Comments</h3>
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
                </div>
            </div>
            <table id="has_context" class="table table-hover">
                <thead>
                    <tr class="filters">
                        <th><input type="text" class="form-control" placeholder="Review ID" name="idreview" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Buyer ID" name="idbuyer" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Reported" name="reported" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Removed" name="removed" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Rating" name="rating" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Text" name="text" disabled></th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <div class="row text-center">

        <ul class="pagination">
            {for $i = 0 to $pages}
                <li><a href="#" onclick="loadComments({$i})">{$i+1}</a></li>
            {/for}
        </ul>
    </div>
</div>



<ul id="contextMenu" class="dropdown-menu" role="menu" style="display:none" >
    <li role="presentation" class="dropdown-header">Set Hidden?</li>
    <li class="divider"></li>
    <li class="item"><a href="#">Yes</a></li>
    <li class="item"><a href="#">No</a></li>

</ul>



{include file='common/footer.tpl'}

<script src="{$BASE_URL}javascript/manageComments.js"></script>
<script src="{$BASE_URL}javascript/contextMenu.js"></script>