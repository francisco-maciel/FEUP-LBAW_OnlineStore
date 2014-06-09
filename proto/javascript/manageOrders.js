
var states;
var stateSelect = "";

$(document).ready(function() {
   
    loadOrderStates();
});

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
    var element = $(this);
    setTimeout(function()
    {
        fetch(element);
    }
    , 500);
});

function fetch(arg) {
    var $input = arg,
            inputContent = $input.val().toLowerCase(),
            $panel = $input.parents('.filterable'),
            column = $panel.find('.filters th').index($input.parents('th')),
            //$table = $panel.find('.table'),
            //$rows = $table.find('tbody tr'),
            rowtext = $('.filters>:eq(' + column + ')>input').attr('name');
    $('th>input').val("");
    $input.val(inputContent);
    var loc = document.URL.replace(/pages\/(.*)/, "actions/manage/getOrders.php?limit=20&offset=0&col=" + rowtext + "&text=" + inputContent);
    $('h3.panel-title').html("Orders (Loading...)");
    $.ajax({
        url: loc,
        context: document.body,
        dataType: 'json'
    }).done(function(data) {
        $('tbody').empty();
        $('h3.panel-title').html("Orders");
        paginate(rowtext, inputContent);
        processData(data);
    }).fail(function(jqXHR, textStatus) {
        alert("FAILED!\nWhat: Orders\nWhy: " + textStatus);
    });

}

function paginate(colname, text) {
    var loc = document.URL.replace(/pages\/(.*)/, "actions/manage/count.php?table=order_&field=" + colname + "&text=" + text);
    var pages = 0;
    $.ajax({
        url: loc,
        context: document.body,
        dataType: 'json'
    }).done(function(data) {
        pages = data.count / 20;
        var element = $('.pagination');
        element.empty();
        for (var i = 0; i <= pages; i++) {
            element.append('<li><a href="#" onclick="loadOrders(' + i + ',\'' + colname + '\',\'' + text + '\')">' + (i + 1) + '</a></li>');
        }
    });

}

function loadOrders(batch, colname, text) {
    colname = colname || null;
    text = text || null;
    var limit = 20;
    var offset = 20 * batch;
    var loc = document.URL.replace(/pages(.*)/, "actions/manage/getOrders.php?limit=" + limit + "&offset=" + offset);
    if (colname !== null && text !== null) {
        loc += '&col=' + colname + '&text' + text;
    }
    $('h3.panel-title').html("Orders (Loading...)");
    $.ajax({
        url: loc,
        context: document.body,
        dataType: 'json'
    }).done(function(data) {
        $('tbody').empty();
        $('h3.panel-title').html("Orders");
        processData(data);
    }).fail(function(jqXHR, textStatus) {
        alert("FAILED!\nWhat: Load Orders\nWhy: " + textStatus);
    });
}

function loadOrderStates() {
    var loc = document.URL.replace(/pages\/admin_area\/manage_orders.php(.*)/, "actions/manage/getOrderStates.php");
    $.ajax({
        url: loc,
        context: document.body,
        dataType: 'json'
    }).done(function(data) {
        states = data;
        initContextMenu();
        loadOrders(0);
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

function createSelect() {
    for (var i = 0; i < states.length; i++) {
        stateSelect += '<option value="' + states[i].idstate + '">' + states[i].name + '</option>';

    }
    //stateSelect = '<option value="2"></option><option value="3"></option><option value="6"></option>';
}

function processCtxMenuSel(selectedMenu, invokedOn) {
    var idState = getIdStateByName(selectedMenu.text());
    var id = invokedOn.context.previousSibling.textContent;
    var loc = document.URL.replace(/pages\/admin_area\/manage_orders.php(.*)/, "actions/manage/setOrderState.php");
    $.post(loc, {orderId: id, stateId: idState})
            .done(function(data) {
                //alert("Data Loaded: " + data);
                $('#order' + id).next().html(states[idState - 1].name);
            });
   

}

function getIdStateByName(name) {
    for (var i = 0; i < states.length; i++) {
        if (states[i].name === name) {
            return states[i].idstate;
        }
    }
}
function processData(data) {
    var loc = document.URL.replace(/pages(.*)/, "pages/users/order.php");
    data.forEach(function(obj) {
        //create row on table
        //getOrderTotal(obj.idorder);
        $('tbody').append('<tr>\n\
                <td id="order' + obj.idorder + '"><a href="' + loc + '?id=' + obj.idorder + '">' + obj.idorder + '</a></td>' +
                //'<td><select class="form-control">' + stateSelect + '</select></td>'+
                '<td>' + obj.name + '</td>' +
                '<td>' + obj.date_placed + '</td>' +
                '<td id="total' + obj.idorder + '">' + obj.total + ' </td>' +
                '</tr>');
    });
}