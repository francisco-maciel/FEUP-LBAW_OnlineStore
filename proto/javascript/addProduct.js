
var dep_id;
var cat_id;

$(document).ready(function() {
    var id = window.location.search;
    if (id !== "") {
        if (!getProductFillForm(parseInt(id.split("=")[1]))) {
            //product is retrieved and form filled, return
            return;
        }
        //fails
        alert("Something went wrong, couldn't load the product...");
    }
    loadDepartments();
    loadCategories(1);
});

$('#prod_family').change(function()
{
    loadCategories($(this).val());
});


$('#prod_stock').on('input', function() {
    var input = ($(this).val());
    if (!isNaN(input) && isInt(input)) {
        $('#prod_stock').parent().parent().attr("class", "form-group has-success has-feedback");
        $('#prod_stock ~ span').attr("class", "glyphicon glyphicon-ok form-control-feedback");
    } else {
        $('#prod_stock').parent().parent().attr("class", "form-group has-error has-feedback");
        $('#prod_stock ~ span').attr("class", "glyphicon glyphicon-remove form-control-feedback");
    }
});

$('#prod_price').on('input', function() {
    var input = ($(this).val());
    if (!isNaN(input) && input > 0) {
        $('#prod_price').parent().parent().attr("class", "form-group has-success has-feedback");
        $('#prod_price ~ span').attr("class", "glyphicon glyphicon-ok form-control-feedback");
    } else {
        $('#prod_price').parent().parent().attr("class", "form-group has-error has-feedback");
        $('#prod_price ~ span').attr("class", "glyphicon glyphicon-remove form-control-feedback");
    }
});

function addDep() {
    var name = $('input#add-dep').val();
    var loc = document.URL.replace(/pages\/(.*)/, "actions/manage/addDepartment.php" + "?name=" + name);
    $.ajax(loc).done(function(data) {
        $('select#prod_family').empty();
        loadDepartments();
    });
}

function addCat() {
    var dep = $('#prod_family')[0].selectedIndex + 1;
    var cat = $('input#add-cat').val();
    var loc = document.URL.replace(/pages\/(.*)/, "actions/manage/addCategory.php?depid=" + dep + "&name=" + cat);
    $.ajax(loc).done(function(data) {
        $('select#prod_family').empty();
        $('select#prod_category').empty();
        loadDepartments(dep);
        loadCategories(dep);
    });
    
}

function isInt(n) {
    return (n % 1 === 0 && n >= 0 && n < 2147483647);
}

function loadDepartments(selected) {
    selected = selected || 1;
    var loc = document.URL.replace(/pages\/admin_area\/add_product.php(.*)/, "actions/manage/getDepartments.php");
    $.ajax({
        url: loc,
        context: document.body,
        dataType: "json"
    }).done(function(data) {
        data.forEach(function(obj) {
            $('#prod_family').append("<option value=" + obj.id + ">" + obj.name + "</option>");
        });
        $('#prod_family option[value=' + selected + ']').attr("selected", "selected");
    });
}

$("#form").on("submit", function() {
    if ($('.glyphicon-remove').length !== 0) {
        $('span.glyphicon-remove').prev().tooltip('show');
        setTimeout(function() {
            $('span.glyphicon-remove').prev().prev().tooltip('hide');
        }, 2000);
        return false;
    }

});


function loadCategories(id, selected) {
    selected = selected || 1;
    $('#prod_category').empty();
    var loc = document.URL.replace(/pages\/admin_area\/add_product.php(.*)/, "actions/manage/getDepCategories.php?id=" + id);
    $.ajax({
        url: loc,
        context: document.body,
        dataType: "json"
    }).done(function(data) {
        data.forEach(function(obj) {
            $('#prod_category').append("<option value=" + obj.id + ">" + obj.name + "</option>");
        });
        $('#prod_category option[value=' + selected + ']').attr("selected", "selected");
    });
}

function getProductFillForm(id) {
    if (id === NaN && !isInt(id)) {
        return false;
    }

    var loc = document.URL.replace("pages/admin_area/add_product.php", "actions/products/getProduct.php");
    $.ajax({
        url: loc,
        context: document.body,
        dataType: "json"
    }).done(function(data) {
        if (typeof data.error === 'undefined') {
            //we got a proper response from api
            $('#prod_name').val(data.title);
            $('#prod_stock').val(data.stock);
            $('#prod_price').val(data.price);
            $('#prod_desc').val(data.description);
            //$('#prod_image').val(data.img.split('/')[1]);
            dep_id = data.idcategory;
            cat_id = data.iddepartment;
            loadDepartments(dep_id);
            loadCategories(dep_id, cat_id);
        }
    });
}