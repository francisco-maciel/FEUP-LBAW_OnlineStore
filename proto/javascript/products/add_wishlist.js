/**
 * Created by Francisco on 23/05/2014.
 */


$(document).ready(function() {

var id = $('.product_id').attr('id');

    var loc = document.URL.replace("pages/products/product.php?id", "actions/products/add_wishlist.php?productid");

    var loc2 = document.URL.replace(/pages\/(.*)/, "pages/users/wish_list.php");

    $('#add_wish_list_button').click(function ( event) {
        $.ajax({
            dataType:"json",
            url:loc,
            success:function(result) {
                if (result.success == 'ok') {
                    alertify.alert("This item was added to your wish list!");
                    $('#add_wish_list_button').replaceWith('<button id="wish_list_added" name="" href="'+loc2+'" " title="This is item is on your wish list!" class="btn btn-labeled btn-warning" ><span class="glyphicon glyphicon glyphicon-star"></span> </button>');
                    $('#wish_list_added').click(function (event) {
                        window.location  = $(this).attr('href');
                    });
                }
                else {
                    alertify.alert(result.error);
                }
            }
        });
    });

    $('#wish_list_added').click(function (event) {
        window.location  = $(this).attr('href');
    });

});