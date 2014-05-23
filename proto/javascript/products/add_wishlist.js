/**
 * Created by Francisco on 23/05/2014.
 */


$(document).ready(function() {

var id = $('.product_id').attr('id');

    var loc = document.URL.replace("pages/products/product.php?id", "actions/products/add_wishlist.php?productid");
    $('#add_wish_list_button').click(function ( event) {
        $.ajax({
            dataType:"json",
            url:loc,
            success:function(result) {
                if (result.success == 'ok') {
                    alertify.alert("This item was added to your wish list!");
                    // TODO mudar botao
                }
                else {
                    alertify.alert(result.error);
                }
            }
        });
    });

});