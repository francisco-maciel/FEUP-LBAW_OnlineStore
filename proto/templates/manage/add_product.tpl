{include file='common/header.tpl'}

<div class="container">

            <div class="row">

                <form class="form-horizontal" method="POST" action="{$BASE_URL}actions/manage/add_product.php" >
                    <fieldset id="add_product">

                        <!-- Form Name -->
                        <legend>Add new Product</legend>

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
                                    <option value="1">Accessories</option>
                                    <option value="2">Electronic</option>
                                    <option value="3">Laptops</option>
                                    <option value="">Garden</option>
                                    <option value="">Food</option>
                                </select>
                            </div>
                        </div>

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="prod_stock">Stock availiable</label>  
                            <div class="col-md-2">
                                <input id="prod_stock" name="prod_stock" type="number" placeholder="Enter stock" class="form-control input-md" required="">
                                <span class="help-block">Must be an integer</span>  
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="prod_price">Price</label>  
                            <div class="col-md-2">
                                <input id="prod_stock" name="prod_price" type="number" placeholder="Enter price" class="form-control input-md" required="">
                                <span class="help-block">Must be an number</span>  
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
                                <button id="prod_save" name="prod_save" class="btn btn-success">Save</button>
                            </div>
                        </div>


                    </fieldset>
                </form>

            </div>

        </div>

{include file='common/footer.tpl'}