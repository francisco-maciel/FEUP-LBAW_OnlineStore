/**
 * Created by Francisco on 03/06/2014.
 */
var cartPanel;
$(document).ready(function() {
     loc = document.URL.replace(/(pages|actions)(\/(.*))*/, '');


    if (typeof(Storage) === "undefined")
    {
        alert("Sorry your browse does not support adding items to cart. Please upgrade to a more recent browser as soon as you can. ");
    }


    cart = getCart();
    updateCart(cart);
    setListeners(cart);
    updateTotals(cart);
});



function setCart(cart) {
    sessionStorage.cart = JSON.stringify(cart);
}
function getCart() {
 if (!sessionStorage.cart)
    sessionStorage.setItem("cart", JSON.stringify({
            items: []
        }
    ));

    var cart = JSON.parse(sessionStorage.cart);
    addControllers(cart);
    return cart;
}
function addProductControllers(item) {
    item.getTitle = function() {
        return item.title;
    }

}
function product(pid,pname,pprice,pimage) {
    var product = {
        id: pid,
        name: pname,
        price: pprice,
        img: pimage
    }

    addProductControllers(product);
    return product;
}

function addControllers(cart) {
    cart.numberOfItems = function() {
        return cart.items.length;
    }



    cart.items.forEach(function(item, index, array) {
        addProductControllers(item);

    })

}


function updateCart(cart) {

    var loc =  document.URL.replace(/(pages|actions)(\/(.*))*/, '');

    cart.items.forEach(function (item) {

        $('.cart_row').last().after('<tr class="cart_row">' +
            '<td class="col-sm-8 col-md-6 ">'
          + ' <div class="media">'
              +  '<a class="thumbnail pull-left" href="'+loc+'pages/products/product.php?id='+item.id+'"> <img class="media-object" style="max-width:80px;min-width:80px; height: auto;" src="'+loc+'images/products/'+item.img+'" style="width: 72px; height: 72px;"> </a>'
                  + ' <div class="media-body">'
                      + ' <h4 class="media-heading"><a href="#">'+item.name+'</a></h4>'
            + ' <h5 class="media-heading"> ref: <b class="item_id" >'+item.id+'</b></h5>'
            +     ' <span>Status: </span><span class="stock"><strong></strong></span>'
            +       '  </div>'
            +  ' </div></td>'
            + ' <td class="col-sm-1 col-md-1" style="text-align: center">'
            +  ' <input min="1" required="true" type="number" class="form-control quantity"  value="'+item.quantity+'">'
            +   '</td>'
            + '<td class="col-sm-1 col-md-1 text-center"><strong>'+item.price.toFixed(2) +' €</strong></td>'
            +'<td class="col-sm-1 col-md-1 text-center "><strong class="total" >'+ (item.price * item.quantity).toFixed(2) +' €</strong></td>'
            + ' <td class="col-sm-1 col-md-1">'
            + ' <button type="button" class="btn btn-danger remove_button">'
            + ' <span class="glyphicon glyphicon-remove"></span> Remove'
            +  '</button></td>'
            +'  </tr>');


    });
    checkInStock();

}

function setListeners() {

    $('.quantity').change(function () {
        var cart = getCart();
        var n = $(this).val();
        if (!isNaN(n)) {

        var row = $(this).closest('.cart_row');
        var id = $(this).closest('.cart_row').find('.item_id').html();
        cart.items.forEach(function(item) {
            if (item.id == id) {
                item.quantity = n;
                row.find('.total').html( (item.price * item.quantity).toFixed(2) +' €');
            }

        });
            setCart(cart);
        }

        updateTotals(cart);
        checkInStock();
    });


    $('.remove_button').click(function () {
        var row = $(this).closest('.cart_row');
        var id = $(this).closest('.cart_row').find('.item_id').html();

        cart.items.forEach(function(item, index) {
            if (item.id == id) {
               cart.items.splice(index, 1);
            }

        });
        setCart(cart);
        updateTotals(cart);
        row.remove();
    });


    $('#checkout').submit(function() {
        var cart = getCart();
        if (cart.items.length == 0) {
            alertify.alert("You need to add at least one item to your card to proceed.");
            return false;
        }

        if (!checkInStock()) {
            alertify.alert('The items you ordered are not available in stock for this quantity');
            return false;
        }

        if (!valid_login) {
            loc = document.URL.replace(/(pages|actions)(\/(.*))*/, '');
            console.log(loc);
            var string = 'You need to be registered to continue your purchase.<br/> Dont have an account? Register <a href="'.concat(loc);
            string = string.concat('pages/users/register.php">here</a>  ')
            alertify.alert(string);
            return false;
        }

    });

}


function updateTotals(cart) {
    var total = 0;
    cart.items.forEach(function(item) {
        total+= item.quantity * item.price;

    });

    $('#subtotal').html(total.toFixed(2) + ' €');
    $('#postage').html(1.99 + ' €');
    $('#total').html((total + 1.99).toFixed(2) + ' €');



}


function checkInStock() {

    var all_in_stock = true;

    $('.cart_row').each(function() {
        var id = $(this).find('.item_id').html();

        if (typeof id !== 'undefined') {
            var quantity = $(this).find('.quantity').val();
            var valid = checkValidStock(id, quantity);
            if (valid) {
                $(this).find('.stock').html('<strong>In Stock</strong>');
                $(this).find('.stock').removeClass('text-danger');
                if (!$(this).find('.stock').hasClass('text-success')) $(this).find('.stock').addClass('text-success');
            }
            else {
                all_in_stock = false;
                $(this).find('.stock').html('<strong>Stock not enough</strong>');
                if (!$(this).find('.stock').hasClass('text-danger')) $(this).find('.stock').addClass('text-danger');
                $(this).find('.stock').removeClass('text-success');
            }
        }


    });



    return all_in_stock;
}

function checkValidStock(id, quantity) {

    var in_stock;
    all_products.forEach(function(product) {
        if (product.idproduct == id) {

            if (product.stock < quantity) in_stock =  false
            else in_stock =  true;

        }

    });

    return in_stock;
}