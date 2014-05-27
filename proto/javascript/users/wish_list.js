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
        var product = $(this);
        $.ajax({
            dataType:"json",
            url:loc,
            data: {id: selected_id},
            success:function(result) {
                if (result.error == null) {
                   $('.thumbnail#'+result.id).parent().fadeOut();
                    $.when( product.find(".thumbnail").parent().fadeOut(500)).done(function() {

                      if ( $(".thumbnail").filter(":visible").size() - 1 <= 0){
                          setTimeout(function(){
                              $("#content.row").append('<div  class="col-sm-12 col-lg-12 col-md-12"><div class="row"></div><h4 style="color:gray">No items on your wish list</h4> </div>');
                          }, 500);
                      }



                    });

                }
            }
        });
    }

}

