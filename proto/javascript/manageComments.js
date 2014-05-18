/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


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

    loadComments();
});


function loadComments() {
    var loc = document.URL.replace(/pages\/(.*)/, "actions/manage/getComments.php");
    $('h3.panel-title').html("Comments (Loading...)");
    $.ajax({
        url: loc,
        context: document.body,
        dataType: 'json'
    }).done(function(data) {
        $('h3.panel-title').html("Comments");
        data.forEach(function(obj) {
            //create row on table
            $('tbody').append('<tr id="review' + obj.idreview + '">' +
                    '<td>' + obj.idreview + '</td>' +
                    //'<td><select class="form-control">' + stateSelect + '</select></td>'+
                    '<td id="buyer' + obj.idbuyer + '">' + obj.idbuyer + '</td>' +
                    '<td>' + obj.reported + ' </td>' +
                    '<td>' + obj.rating + ' </td>' +
                    '<td>' + obj.text + '</td>' +
                    '</tr>');
        }).fail(function(jqXHR, textStatus) {
            alert("FAILED!\nWhat: Comments\nWhy: " + textStatus);
        });
    });
}

function processCtxMenuSel(selectedMenu, invokedOn) {
    var state = selectedMenu.text();
    if (state === "Yes")
        state = "true";
    else
        state = "false";
    var id = invokedOn.parent().attr("id").split("review")[1];
    var loc = document.URL.replace(/pages\/(.*)/, "actions/manage/reviewState.php");
    $.post(loc, {review: id, state: state})
            .done(function(data) {
                //alert("Data Loaded: " + data);
                $('#review' + id + '>:eq(2)').html(state);
            });


}