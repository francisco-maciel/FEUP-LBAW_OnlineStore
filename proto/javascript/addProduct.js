/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */




$(document).ready(function() {
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

function isInt(n) {
    return (n % 1 === 0 && n >= 0);
}

function loadDepartments() {
    var loc = document.URL.replace("pages/admin_area/add_product.php", "actions/manage/getDepartments.php");
    $.ajax({
        url: loc,
        context: document.body,
        dataType: "json"
    }).done(function(data) {
        data.forEach(function(obj) {
            $('#prod_family').append("<option value=" + obj.id + ">" + obj.name + "</option>");
        });
        
        
    });
}

function loadCategories(id) {
    $('#prod_category').empty();
    var loc = document.URL.replace("pages/admin_area/add_product.php", "actions/manage/getDepCategories.php?id=" + id);
    $.ajax({
        url: loc,
        context: document.body,
        dataType: "json"
    }).done(function(data) {
        data.forEach(function(obj) {
            $('#prod_category').append("<option value=" + obj.id + ">" + obj.name + "</option>");
        });


    });
}