{include file='common/header.tpl'}

<div class="modal fade modal-large" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="mySmallModalLabel">Manage Users Help</h4>
            </div>
            <div class="modal-body">
                <p>On this page an admin/manager can add a new product or edit details of another.</p>
                <ol>
                    <li><a href="#1">Form requirements</a></li>
                    <li><a href="#2">Edit a product</a></li>
                    <li><a href="#3">Add a new Department</a></li>
                    <li><a href="#4">Add a new Category for a department</a></li>
                    <li><a href="#5">Dynamically add new filters</a></li>
                </ol>
                <hr>
                <ol>
                    <li id="1">Form requirements</li>
                    <br>
                    <p>All form fields presented are required except for the product image, the image size must be below 10000000 bytes (10MB), to upload one simple click <i>browse</i>
                        button and choose one.
                        Price field must be a number with the following and may or may not have a decimal part.
                        Stock must be a number and an integer. Values that end in .0 are also accepted.
                        <br><br><b>Note:</b>Decimal parte is denoted by a period '.'.<br><br>
                        The form has a field validator,
                        <img src="{$BASE_URL}images/assets/error-label.png" alt="error field">
                        Which means the input for that field is not valid, also hints may be presented to the user where availiable such as
                        <img src="{$BASE_URL}images/assets/tooltip.png" alt="tooltip">
                        <br>If the user tries to submit the form with non-valid data
                    </p>
                    <br>
                    <li id="2">Edit a product</li>
                    <br>
                    <p>To edit, please browse the store for the desired product and if logged as a manager a yellow button <i>Edit details</i>
                        will be availiable
                        <br> <img src="{$BASE_URL}images/assets/edit-product.png" alt="edit product">
                        <br> wich will open this interface with the form pre-filled for you.
                    </p>
                    <br>
                    <li id="3">Add a new Department</li>
                    <br>
                    <p>Simply click on the <img src="{$BASE_URL}images/assets/add-dep.png" alt="add dep sign"> sign by the departments selector and a pop-up should come up, just enter the new department name
                        and click <i>Add</i> button.
                        <br>
                    </p>

                    <br>
                    <li id="4">Add a new Category</li>
                    <br>
                    <p>Same as <i>section #3</i>, but this time clicking on the sign by the category field.
                        <br><b>Note: You have to choose beforehand the the department to which you want to add the category on the department dropdown</b>
                        <br>
                    </p>
                    <li id="5">Dynamically add new filters</li>
                    <br>
                    <p>Every product is different, so to incorporate that you can also add filters to the product, this works as specifications of the item
                        and may or may not be specific to a single object.
                        <br>Begin by clicking on <i>Add new Field</i> button
                        <br><img src="{$BASE_URL}images/assets/add-new.png" alt="add new field">
                        <br>And you will noticed two new input fields appended to the form
                        <br><img src="{$BASE_URL}images/assets/filter-fields.png" alt="filter fields">
                        <br>Just type in the name and the value and you are good to go, you can add multiple filters by repeating the process.
                    </p>
                    <br>
                    
                </ol>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>

            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="modal fade .bs-add-dep-modal-sm" id="add-dep" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h4 class="modal-title" id="mySmallModalLabel">Add new department</h4>
            </div>
            <div class="modal-body">
                <label>Dep name </label><input id="add-dep" name="dep_name" type="text" placeholder="enter a name">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-success btn-primary" data-dismiss="modal" onclick="addDep()">Add</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="modal fade .bs-add-cat-modal-sm" id="add-cat" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h4 class="modal-title" id="mySmallModalLabel">Add new Category</h4>
            </div>
            <div class="modal-body">
                <label>Cat name </label><input id="add-cat" name="cat_name" type="text" placeholder="enter a name">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-success btn-primary" data-dismiss="modal" onclick="addCat()">Add</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<div class="container">

    <div class="row">
        {if (isset($param))}
            <form id="form" class="form-horizontal" method="POST" enctype="multipart/form-data" action="{$BASE_URL}actions/manage/addProduct.php{$param}" >
            {else}
                <form id="form" class="form-horizontal" method="POST" enctype="multipart/form-data" action="{$BASE_URL}actions/manage/addProduct.php" >

                {/if}

                <fieldset id="add_product">

                    <!-- Form Name -->
                    <legend>Add new Product <a href="#" data-toggle="modal" data-target=".modal-large" class="glyphicon glyphicon-info-sign"></a></legend>

                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="prod_name">Product name</label>
                        <div class="col-md-6">
                            <input id="prod_name" name="prod_name" type="text" placeholder="enter a title" class="form-control input-md" required="">

                        </div>
                    </div>

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="prod_family">Product Department</label>
                        <div class="col-md-4">
                            <select id="prod_family" name="prod_family" class="form-control">


                            </select>
                        </div>
                        <button type="button" data-toggle="modal" data-target="#add-dep" class="btn glyphicon glyphicon-plus-sign"></button>
                    </div>

                    <div class="form-group">
                        <label class="col-md-4 control-label" for="prod_category">Department Category</label>
                        <div class="col-md-4">
                            <select id="prod_category" name="prod_category" class="form-control">

                            </select>
                        </div>
                        <button type="button" data-toggle="modal" data-target="#add-cat" class="btn glyphicon glyphicon-plus-sign"></button>

                    </div>

                    <!-- Text input-->
                    <div class="form-group has-feedback">
                        <label class="col-md-4 control-label" for="prod_stock">Stock available</label>
                        <div class="col-md-2 ">
                            <input id="prod_stock" name="prod_stock" data-trigger="manual" data-toggle="tooltip" data-placement="top" title="Please enter valid input" placeholder="Enter stock" class="form-control input-md" required="">
                            <span class="form-control-feedback"></span>
                        </div>
                    </div>

                    <!-- Text input-->
                    <div class="form-group has-feedback">
                        <label class="col-md-4 control-label" for="prod_price">Price</label>
                        <div class="col-md-2">
                            <input id="prod_price" name="prod_price" data-trigger="manual" data-toggle="tooltip" data-placement="top" title="Please enter valid input" placeholder="Enter price" class="form-control input-md" required="">
                            <span class="form-control-feedback"></span>
                        </div>
                    </div>

                    <!-- Textarea -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="prod_desc">Description</label>
                        <div class="col-md-4">
                            <textarea onclick="clearText('prod_desc')" class="form-control" id="prod_desc" name="prod_desc">Add a description</textarea>
                        </div>
                    </div>

                    <!-- File Button -->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="prod_img">Add images</label>
                        <div class="col-md-4">
                            <input id="prod_image" name="prod_img" class="input-file" type="file">
                        </div>
                    </div>

                    <!-- Button (Double) -->
                    <div class="form-group" id="form_submit">
                        <label class="col-md-4 control-label" for="prod_add_new_row"></label>
                        <div class="col-md-8">
                            <button type="button" id="prod_add_new_row" onclick="appendToForm('form_submit')" name="prod_add_new_row" class="btn btn-info">Add new Field</button>
                            <button type="reset" id="prod_clear" name="prod_clear" class="btn btn-danger">Clear</button>
                            <button type="submit" id="prod_save" name="prod_save" class="btn btn-success">Save</button>
                        </div>
                    </div>


                </fieldset>
            </form>

    </div>

</div>


{include file='common/footer.tpl'}

<script src="{$BASE_URL}javascript/addProduct.js"></script>


