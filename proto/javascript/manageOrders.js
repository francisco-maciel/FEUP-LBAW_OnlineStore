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

    loadOrderStates();
    loadOrders();
});

function loadOrderStates() {
    var loc = document.URL.replace(/pages\/admin_area\/manage_orders.php(.*)/, "actions/manage/getOrderStates.php");
    $.ajax({
        url: loc,
        context: document.body,
        dataType: 'json'
    }).done(function(data) {
        states = data;
        createSelect();

    });
}

function loadOrders() {
    var loc = document.URL.replace(/pages\/admin_area\/manage_orders.php(.*)/, "actions/manage/getOrders.php");
    $.ajax({
        url: loc,
        context: document.body,
        dataType: 'json'
    }).done(function(data) {
        data.forEach(function(obj) {
            //create row on table
            $('tbody').append('<tr>\n\
                <td>' + obj.idorder + '</td>' +
                    //'<td><select class="form-control">' + stateSelect + '</select></td>'+
                    '<td>' + states[obj.idstate - 1].name + '</td>' +
                    '<td>' + obj.date_placed + '</td>\n\
                <td> ##SUBTOTAL## </td>\n\
            </tr>');
        });
    });
}

function createSelect() {
    for (var i = 0; i < states.length; i++) {
        stateSelect += '<option value="' + states[i].idstate + '">' + states[i].name + '</option>';

    }
    //stateSelect = '<option value="2"></option><option value="3"></option><option value="6"></option>';
}
