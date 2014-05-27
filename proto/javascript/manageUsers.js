/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {
    loadUsers(0);
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
    var loc = document.URL.replace(/pages\/(.*)/, "actions/manage/getUsers.php?limit=20&offset=0&col=" + rowtext + "&text=" + inputContent);
    $('h3.panel-title').html("Users (Loading...)");
    $.ajax({
        url: loc,
        context: document.body,
        dataType: 'json'
    }).done(function(data) {
        $('tbody').empty();
        $('h3.panel-title').html("Users");
        paginate(rowtext, inputContent);
        processData(data);
    }).fail(function(jqXHR, textStatus) {
        alert("FAILED!\nWhat: Comments\nWhy: " + textStatus);
    });

}

function paginate(colname, text) {
    var loc = document.URL.replace(/pages\/(.*)/, "actions/manage/count.php?table=user_&field=" + colname + "&text=" + text);
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
            element.append('<li><a href="#" onclick="loadUsers(' + i + ',\'' + colname + '\',\'' + text + '\')">' + (i + 1) + '</a></li>');
        }
    });

}

function processCtxMenuSel(selectedMenu, invokedOn) {
    var level = selectedMenu.text();
    var id = invokedOn.context.previousSibling.textContent;
    var loc = document.URL.replace(/pages(.*)/, "actions/manage/setUserLevel.php");
    $.post(loc, {userId: id, level: level})
            .done(function(data) {
                //alert("Data Loaded: " + data);
                if (data === "true") {
                    $('#user' + id).next().html(level);
                }
            }).fail(function(jqXHR, textStatus) {
        alert("FAILED!\nWhat: SetLevel\nWhy: " + textStatus);
    });
}

var types = [
    "Buyer",
    "Manager"
];

function loadUsers(batch, colname, text) {
    colname = colname || null;
    text = text || null;
    var limit = 20;
    var offset = 20 * batch;
    var loc = document.URL.replace(/pages(.*)/, "actions/manage/getUsers.php?limit=" + limit + "&offset=" + offset);
    if (colname !== null && text !== null) {
        loc += '&col=' + colname + '&text' + text;
    }
    $('h3.panel-title').html("Users (Loading...)");
    $.ajax({
        url: loc,
        context: document.body,
        dataType: 'json'
    }).done(function(data) {
        $('tbody').empty();
        $('h3.panel-title').html("Users");
        processData(data);
    }).fail(function(jqXHR, textStatus) {
        alert("FAILED!\nWhat: Load Users\nWhy: " + textStatus);
    });
}

function processData(data) {
    var loc = document.URL.replace(/pages(.*)/, "pages/users/profile.php");
    data.forEach(function(obj) {
        //create row on table

        $('tbody').append('<tr>\n\
                <td id="user' + obj.iduser + '"><a href="' + loc + '?id=' + obj.iduser + '">' + obj.iduser + '</a></td>' +
                //'<td><select class="form-control">' + stateSelect + '</select></td>'+
                '<td>' + types[obj.user_type] + '</td>' +
                '<td>' + obj.name + '</td>' +
                '<td> ' + obj.email + ' </td>' +
                '<td> ' + obj.banned + ' </td>' +
                '</tr>');
    });
}
