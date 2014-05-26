/**
 * Created by Francisco on 23/05/2014.
 */
var selected_id = null;

var loc = document.URL.replace(/pages\/(.*)/, "actions/products/remove_from_wish_list.php");

$(document).ready(function() {

    $(".thumbnail").append('<div class="remove_button" data-toggle="modal" data-target=".bs-example-modal-sm" id="tooltip" style="position:absolute; top:5px; right: 20px; cursor: pointer; "  title="Remove from wish list"><span class="glyphicon glyphicon glyphicon-remove-circle"></span></div>');

    $(".remove_button").click(function (event) {
        selected_id = $(this).parent(".thumbnail").attr("id");
    });
});

function remove_from_wish_list(id) {
    if (selected_id == null) {
        alertify.alert("No product selected");
        return;
    }
    else {

        $.ajax({
            dataType:"json",
            url:loc,
            data: {id: selected_id},
            success:function(result) {
            }
        });
    }

}

function select_id() {

    var id = $('')
}