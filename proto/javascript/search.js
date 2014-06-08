
$(document).ready(function() {
    
    /*if(type==="search") {
        //getSearchProducts(0);
    }
    else
        if(type==="dep")
        {
            //getDepProducts(0);
        }
        else
            if(type==="cat")
                   //getCatProducts(0);
    */
   if(type==="dep") { //produtos de dado departamento
     $('.paginate_click').click(function() {
       var clicked_id = $(this).attr("id").split("-"); //ID of clicked element, split() to get page number.
       var page_num = parseInt(clicked_id[0]); //clicked_id[0] holds the page number we need
       $('.paginate_click').removeClass('active');
       var pos = (page_num-1) * items_per_page;
       getDepProducts(pos);
       $(this).addClass('active');
       return false;
     });
   }
   else //produtos de dada categoria, com filtros
       {
           
       }
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

function showPagination(loc) {
    
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
    result+="</div><div class=\"ratings\">\n"+
            "<p class=\"pull-right\">15 reviews</p><p>\n"+
            "<span class=\"glyphicon glyphicon-star\"></span>\n"+
            "<span class=\"glyphicon glyphicon-star\"></span>\n"+
            "<span class=\"glyphicon glyphicon-star\"></span>\n"+
            "<span class=\"glyphicon glyphicon-star\"></span>\n"+
            "<span class=\"glyphicon glyphicon-star\"></span>\n"+
            "</p></div></div><br></div>";
    
    $('#results').append(result);
}