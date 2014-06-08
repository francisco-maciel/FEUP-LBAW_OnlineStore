
<div class="row">
    <div id="filter-panel" class="collapse filter-panel">
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" role="form">
                    <div class="form-group">
                        <label class="filter-col" style="margin-right:0;" for="pref-perpage">Items per page:</label>
                        <select id="pref-perpage" class="form-control">
                            <option value="3">3</option>
                            <option value="6">6</option>
                            <option selected="selected" value="9">9</option>
                            <option value="12">12</option>
                            <option value="24">24</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                        </select>                                
                    </div> <!-- form group [rows] -->
                    <div class="form-group">
                        <label class="filter-col" style="margin-right:0; margin-left:20px;" for="pref-orderby">Order by:</label>
                        <select id="pref-orderby" class="form-control" style="margin-right:10px;">
                            <option selected="selected">Product Title</option>
                            <option>Price</option>
                        </select> 
                        <select id="pref-orderby" class="form-control">
                            <option selected="selected">Ascendant</option>
                            <option>Descendent</option>
                        </select>                                
                    </div> <!-- form group [order by] --> 
                    <div class="form-group">    
                        <button type="submit" class="btn btn-default filter-col" style="margin-left:20px; margin-right:10px;">
                            <span class="glyphicon glyphicon-record"></span> Search
                        </button>  
                    </div>
                </form>
            </div>
        </div>
    </div>    
    <!--<div class="col-md-3 column margintop20">-->
    <button id="btnAdvancedSearch" type="button" class="btn btn-primary" data-toggle="collapse" data-target="#filter-panel">
        <span class="glyphicon glyphicon-cog"></span> Advanced Search
    </button>
 <!--   </div> -->
</div>