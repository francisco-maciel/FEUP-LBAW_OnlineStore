/**
 * Created by Francisco on 03/06/2014.
 */
var cartPanel;
$(document).ready(function() {
      loc = document.URL.replace(/(pages|actions)(\/(.*))*/, '');

    // cart
        cartPanel = $.jPanelMenu({
        menu: '#cart-panel',
        trigger: '#cart-open',
        openPosition: '20em',
        animated: false,
        closeOnContentClick: false,
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
   // sessionStorage.clear();
    updateCart(getCart());
    checkCartButton(getCart());

});

function checkCartButton(cart) {

   if ( cart.items.length > 0 ) $('.checkout').show();
}

function currentId() {
    return $('.product_id').attr('id');
}

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


    cart.addProduct = function(id,title,price,img) {

        var found = false;
        cart.items.forEach(function (item) {
            if (item.id == id) {
                found = true;
                item.quantity++;
            }
        });
        if (!found) {

        var item = product(id, title, price, img);
        item.quantity = 1;
        cart.items.push(item);

       }
        setCart(cart);
        updateCart(cart);
        if ( cart.items.length > 0 ) $('.checkout').show();

    }

    cart.items.forEach(function(item, index, array) {
        addProductControllers(item);

    })

}

function addProductToCart(id, title, price,img) {
    if (!cartPanel.isOpen()) cartPanel.open();
    var cart = getCart();
    cart.addProduct(id,title,price,img);
    setCart(cart);
}


function updateCart(cart) {
    var total = 0;
    var totalitems = 0;
    cart.items.forEach(function (item) {
        totalitems += parseInt(item.quantity,10);
        total += item.quantity * item.price;
        var element = $('li.cart_item_' + item.id);
        if (element.length == 0) {
            $('.cart_list').append('<li class="cart_item_'+item.id+'"><a href="'+loc+'pages/products/product.php?id='+item.id+'"><img style="max-width:60px;min-width:60px; height: auto;"src="'+loc+'images/products/'+item.img+'" alt=""/> '+item.name+' </a> <span class="quantity">'+item.quantity+' × <span class="amount"> €'+item.price.toFixed(2)+'</span></span> </li>');
        }
        else {
            element.find('.quantity').html('<span class="quantity">'+item.quantity+' × <span class="amount"> €'+item.price.toFixed(2)+'</span></span>');
        }
    });

    $('.total_amount').html('€' + total.toFixed(2));
    $('.shopping-cart').html(parseInt(totalitems,10));
}

function emptyCart() {
    $('.cart_list').empty();
    $('.total_amount').html('€' + 0.00);
    $('.shopping-cart').html(0);
    sessionStorage.clear();
    $('.checkout').hide();

    updateCart(getCart());
    checkCartButton(getCart());
}