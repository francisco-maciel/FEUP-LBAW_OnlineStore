
$(document).on("click",'.paginate_click', function() {
    
    var clicked_id = $(this).attr("id").split("-"); //ID of clicked element, split() to get page number.
    var page_num = parseInt(clicked_id[0]); //clicked_id[0] holds the page number we need
    $('.paginate_click').removeClass('active');
    var pos = (page_num-1) * items_per_page;
    if(type==="dep") { //produtos de dado departamento
        getDepProducts(pos);
    }
    else //produtos de dada categoria, com filtros
    {
        filtering(page_num);
    }
    $(this).addClass('active');
    return false;
});


function getSearchPagination() {
    var loc = document.URL.replace(/pages\/products\/search-prods.php(.*)/, "actions/products/getPaginationCounts.php?namepart=" + value);
    showPagination(loc);
}
function getDepPagination() {
    var loc = document.URL.replace(/pages\/products\/search-prods.php(.*)/, "actions/products/getPaginationCounts.php?dep=" + value);
    showPagination(loc);
}
function getCatPagination() {
    var loc = document.URL.replace(/pages\/products\/search-prods.php(.*)/, "actions/products/getPaginationCounts.php?cat=" + value);
    showPagination(loc);
}

function getSearchProducts(position) {
    var loc = document.URL.replace(/pages\/products\/search-prods.php(.*)/, "actions/products/getSearchProducts.php?namepart=" + value + "&pos="+position+"&ipp="+items_per_page);
    showProducts(loc);
}

function getDepProducts(position) {
    var loc = document.URL.replace(/pages\/products\/search-prods.php(.*)/, "actions/products/getSearchProducts.php?dep=" + value + "&pos="+position+"&ipp="+items_per_page);
    showProducts(loc);
}

function getCatProducts(position) {
    var loc = document.URL.replace(/pages\/products\/search-prods.php(.*)/, "actions/products/getSearchProducts.php?cat=" + value + "&pos="+position+"&ipp="+items_per_page);
    showProducts(loc);
}

function showPagination(pages) {
    if(pages>1) {
        var s="";
        for (var i = 1; i <= pages; i++) {
            s+="<li class=\"paginate_click\" id=\""+i+"-page\"><a href=\"javascript:void(0)\">"+i+"</a></li>\n";
        }
        $('.pagination').append(s);
        $('#1-page').addClass("active");
    }
}

function showProducts(loc) {
    $.ajax({
        url: loc,
        context: document.body,
        dataType: "json"
    }).done(function(data) {
        $('#results').empty();
        data.forEach(function(obj) {
            listProduct(obj);
        });
    });
}

function listProduct(obj) {
    var result = "<div class=\"col-sm-4 col-lg-4 col-md-4\"><div class=\"thumbnail\">";
    if(obj.img)
        result+="<a href=\""+base_url+"pages/products/product.php?id="+obj.idproduct+"\"> <img style=\"min-height:200px; max-height:200px; width:auto;\" class=\"img-responsive\" src=\""+base_url+"images/products/"+obj.img+"\" > </a>\n";
    else
        result+="<a href=\""+base_url+"pages/products/product.php?id="+obj.idproduct+"\"> <img class=\"img-responsive\" src=\""+base_url+"images/products/default.png\" alt=\"\"> </a>\n";    
    
    result+="<div class=\"caption\">";
    
    if(obj.title.length>28)
        result+="<h4> <a href=\""+base_url+"pages/products/product.php?id="+obj.idproduct+"\">"+(obj.title).substr(0,28)+"</a> </h4>\n";
    else   
        result+="<h4> <a href=\""+base_url+"pages/products/product.php?id="+obj.idproduct+"\"> "+obj.title+" </a> </h4>\n";    
    
    result+="<h4 class=\"pull-right\">€"+obj.price+"</h4>";
    result+="</div><div class=\"ratings\" rid=\""+obj.idproduct+"\">\n"+
            "<p class=\"pull-right\"> "+obj.nr_reviews+" reviews</p> <p>\n";
    
    if(obj.avgrating === null) {
        for (var x = 0; x < 5; x++)
            result+= "<span class=\"glyphicon glyphicon-star-empty\"></span>\n";  
    }
    else
    {
        var ratingInt = parseInt(obj.avgrating);
        for (var x = 0; x < ratingInt; x++) {
            result+= "<span class=\"glyphicon glyphicon-star\"></span>\n";
        }
        for (var x = 0; x < 5-ratingInt; x++) {
            result+= "<span class=\"glyphicon glyphicon-star-empty\"></span>\n";
        }
        result+=""+ratingInt;
    }
    result+= " </p></div></div><br></div>";
    
    $('#results').append(result);
}