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
    addAdressListeners();


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

function addAdressListeners() {
    var cart = getCart();



    $('.deliver').click(function () {
       cart.address = $(this).attr('id');

        setCart(cart);
    });
}

