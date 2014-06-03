/**
 * Created by Francisco on 03/06/2014.
 */
$(document).ready(function() {

    // cart
    var cartPanel = $.jPanelMenu({
        menu: '#cart-panel',
        trigger: '#cart-open',
        openPosition: '20em',
        keyboardShortcuts: [
            {
                code: 67, /* C Key */
                open: true,
                close: true
            },
            {
                code: 27, /* Escape Key */
                open: false,
                close: true
            },
            {
                code: 37, /* Left Arrow Key */
                open: false,
                close: true
            },
            {
                code: 39, /* Right Arrow Key */
                open: true,
                close: true
            }
        ]

    });
    cartPanel.on();



    if (typeof(Storage) === "undefined")
    {
        alert("Sorry your browse does not support adding items to cart. Please upgrade to a more recent browser as soon as you can. ");
    }

    updateCart(getCart());


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

    cart.addItem = function(item) {
        cart.items.push(item);

    }

    cart.addProduct = function(id,title,price,img) {
        var item = product(id,title,price,img);
        cart.items.push(item);

    }

    cart.items.forEach(function(item, index, array) {
        addProductControllers(item);

    })

}

function addProductToCart(id, title, price,img) {
    var cart = getCart();
    cart.addProduct(id,title,price,img);
    setCart(cart);
}


function updateCart(cart) {
    console.log(cart);

}