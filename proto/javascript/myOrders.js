/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var states;
var stateSelect = "";

$(document).ready(function() {
    $('.filterable .btn-filter').click(function() {
        var $panel = $(this).parents('.filterable'),
            $filters = $panel.find('.filters input'),
            $tbody = $panel.find('.table tbody');
        if ($filters.prop('disabled') === true) {
            $filters.prop('disabled', false);
            $filters.first().focus();
        } else {
            $filters.val('').prop('disabled', true);
            $tbody.find('.no-result').remove();
            $tbody.find('tr').show();
        }
    });

    $('.filterable .filters input').keyup(function(e) {
        /* Ignore tab key */
        var code = e.keyCode || e.which;
        if (code === '9')
            return;
        /* Useful DOM data and selectors */
        var $input = $(this),
            inputContent = $input.val().toLowerCase(),
            $panel = $input.parents('.filterable'),
            column = $panel.find('.filters th').index($input.parents('th')),
            $table = $panel.find('.table'),
            $rows = $table.find('tbody tr');
        /* Dirtiest filter function ever ;) */
        var $filteredRows = $rows.filter(function() {
            var value = $(this).find('td').eq(column).text().toLowerCase();
            return value.indexOf(inputContent) === -1;
        });
        /* Clean previous no-result if exist */
        $table.find('tbody .no-result').remove();
        /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
        $rows.show();
        $filteredRows.hide();
        /* Prepend no-result row if all rows are filtered */
        if ($filteredRows.length === $rows.length) {
            $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="' + $table.find('.filters th').length + '">No result found</td></tr>'));
        }
    });

    //loadOrderStates();
});

function loadOrderStates() {
    var loc = document.URL.replace(/pages\/user\/myOrders.php(.*)/, "actions/manage/getOrderStates.php");
    $.ajax({
        url: loc,
        context: document.body,
        dataType: 'json'
    }).done(function(data) {
        states = data;
        initContextMenu();
        loadOrders();
        //createSelect();

    }).fail(function(jqXHR, textStatus) {
        alert("FAILED!\nWhat: OrderStates\nWhy: " + textStatus);
    });
}

function initContextMenu() {
    for (var i = 0; i < states.length; i++) {
        $('#contextMenu li.divider').after('<li><a href="#">' + states[i].name + '</a></li>');
    }
}

function loadOrders() {
    var loc = document.URL.replace(/pages\/admin_area\/manage_orders.php(.*)/, "actions/manage/getOrders.php");
    $('h3.panel-title').html("Orders (Loading...)");
    $.ajax({
        url: loc,
        context: document.body,
        dataType: 'json'
    }).done(function(data) {
        $('h3.panel-title').html("Orders");
        data.forEach(function(obj) {
            //create row on table
            getOrderTotal(obj.idorder);
            $('tbody').append('<tr>\n\
                <td id="order' + obj.idorder + '">' + obj.idorder + '</td>' +
                //'<td><select class="form-control">' + stateSelect + '</select></td>'+
                '<td>' + states[obj.idstate - 1].name + '</td>' +
                '<td>' + obj.date_placed + '</td>' +
                '<td id="total' + obj.idorder + '"> Calculating... </td>' +
                '</tr>');
        }).fail(function(jqXHR, textStatus) {
            alert("FAILED!\nWhat: Orders\nWhy: " + textStatus);
        });
    });

}

function getOrderTotal(idOrder) {
    var loc = document.URL.replace(/pages\/admin_area\/manage_orders.php(.*)/, "actions/manage/orderTotal.php?id=" + idOrder);
    $.ajax({
        url: loc,
        context: document.body,
        dataType: 'json'
    }).done(function(data) {
        $('#total' + idOrder).html(data.total);
    }).fail(function(jqXHR, textStatus) {
        alert("FAILED!\nWhat: OrderTotal\nWhy: " + textStatus);
    });
}


function getIdStateByName(name) {
    for (var i = 0; i < states.length; i++) {
        if (states[i].name === name) {
            return states[i].idstate;
        }
    }
}