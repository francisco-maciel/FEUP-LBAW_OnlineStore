var activeFilters=[]; //{id:fid, type:tp, value:val}
var category = $('#cattitle').attr("catid");
var search = $('#searchtitle').attr("search");
var openfilters=[];


$(document).ready(function() {
    addfilters();
    //updatePriceSlider();
});

function updatePriceSlider() {
    $('#filtersList').append("<li class=\"sliderbox active2\"><div id=\"prg\">Price Range: <text class=\"pricerange\" id=\"pr1\"></text> - <text class=\"pricerange\" id=\"pr2\"></text></div><div class=\"slider\"></div></li>");
}

function update_pagination() {
    if(activeFilters.length===0) { //no active filters
           showPagination(init_nr_pages);
    }
    else {
        var loc;
        var farray = JSON.stringify(activeFilters);
        if(category === undefined)
            loc = document.URL.replace(/pages\/products\/search-prods.php(.*)/, "actions/products/getCountFilteredProdswNamepart.php?s="+search+"&filters=" + farray);
        else
            loc = document.URL.replace(/pages\/products\/search-prods.php(.*)/, "actions/products/getCountFilteredProdswCat.php?cat=" + category + "&filters="+farray);
        
        $.ajax({
            url: loc,
            context: document.body,
            dataType: "json"
        }).done(function(data) {
            var nr_pages = Math.ceil(data.count/items_per_page);
            showPagination(nr_pages);
        });
    }
}


function addfilters() {
    if (typeof type != 'undefined') {
        if(type==="cat") {
            var loc = document.URL.replace(/pages\/products\/search-prods.php(.*)/,
                                  "actions/products/getFiltersFromCat.php?id=" + value);
            loadFilters(loc);
        }
        else if(type==="search") {
            var loc = document.URL.replace(/pages\/products\/search-prods.php(.*)/,
                                  "actions/products/getFiltersFromSearch.php?namepart=" + value);
            loadFilters(loc);
        }
    }
    //load slider com preço min e max
}

function loadFilters(loc) {
    
    $.ajax({
        url: loc,
        context: document.body,
        dataType: "json"
    }).done(function(data) {
        
        if(data.length === 0)
            $('#filtersList').append("<li class=\"active2\"><a ><span class=\"glyphicon\"></span> No Filters.</a></li>");
        else {
        data.forEach(function(obj) {
            $('#filtersList').append("<li class=\"filter active2\" id=\"filter"+ obj.id +"\" fid=\""+obj.id+"\"><a href=\"javascript:void(0)\"><span class=\"glyphicon glyphicon-chevron-right\"></span>  "+ obj.name +"</a></li>");//S.hide().fadeIn(200);
        });
        }
        
    });
   
}


function loadFilterValues(id) {
    var loc = document.URL.replace(/pages\/products\/search-prods.php(.*)/, "actions/products/getFilterValues.php?id=" + id);
    $.ajax({
        url: loc,
        context: document.body,
        dataType: "json"
    }).done(function(data) {
        data.forEach(function(obj) {
            if(obj.type===0)
                $('#filter'+id).after("<li class=\"filterson "+id+"\" filter=\""+id+"\" type=\""+obj.type+"\" value=\""+obj.value_string+"\"><a class=\"\" href=\"javascript:void(0)\"><span class=\"glyphicon\"></span>"+ obj.value_string +"</a></li>");
            else
                $('#filter'+id).after("<li class=\"filterson "+id+"\" filter=\""+id+"\" type=\""+obj.type+"\" value=\""+obj.value_int+"\"><a class=\"\" href=\"javascript:void(0)\"><span class=\"glyphicon\"></span>"+ obj.value_int +"</a></li>");
        });
    });
}

function noResultsMsg() {
    var msg = "<div class=\"col-sm-12 col-lg-12 col-md-12\">"+
            "<div class=\"row\"></div>"+
            "<h4 style=\"color:gray\">No items found that match your search</h4></div>";
    $('#results').append(msg);
}

function getProducts(loc) {
    $.ajax({
        url: loc,
        context: document.body,
        dataType: "json"
    }).done(function(data) {
        $('#results').empty();
        if((data.length)===0) { //se vazio adiciona "no items found"
            noResultsMsg();
        }
        else {
            data.forEach(function(obj) {
                listProduct(obj); 
            });
        }
    });
}

function include(id) {
    for(var x=0; x < activeFilters.length; x++) {
        if(activeFilters[x].id === id)
            return x;
    }
    return -1;
}

function removeFromActive(id) {
    for(var x=0; x < activeFilters.length; x++) {
        if(activeFilters[x].id === id){
            activeFilters.slice(x,1);
        }
    }
}

//filter name click (expand/collapse)
//$('li.filter').click(function() {
$(document).on("click",'li.filter', function() {
    var id = $(this).attr("fid");
    $(this).find("span").toggleClass('glyphicon-chevron-down glyphicon-chevron-right');
    if(openfilters.indexOf(id)===-1) {
        loadFilterValues(id);
        openfilters.push(id);
    }
    else
        $('.filterson.'+id).toggle();
});

//filter value click
$(document).on("click",'li.filterson', function() {
    //verificar se já está activado outro valor p o mesmo filtro
    
    if(($(this).find("a").attr("class"))!=='active_selected') {
        var ffid=parseInt($(this).attr("filter"));
        var findex = include(ffid);
        if(findex!==-1) {
            activeFilters.splice(findex,1);
            $('.filterson.'+ffid).find("a").removeClass('active_selected');
        }
    }
    $(this).find("a").toggleClass('active_selected');
    var fid = parseInt($(this).attr("filter"));
    var i = include(fid);
    if(i===-1){
        var tp = parseInt($(this).attr("type"));
        var val;
        if(tp===0)
            val = $(this).attr("value");
        else
            val = parseInt($(this).attr("value"));
        
        activeFilters.push({id:fid, type:tp, value:val});
    }
    else{
        activeFilters.splice(i,1);
    }
     $(".pagination").empty();
    filtering(1);
    update_pagination();
});

//queries para filtragem de resultados
function filtering(page) {
    var loc;
    if(activeFilters.length===0) { //no active filters
        if(category === undefined)
            loc = document.URL.replace(/pages\/products\/search-prods.php(.*)/, "actions/products/getAllSearchProducts.php?s=" + search + "&page="+ page + "&ipp="+items_per_page);
        else
            loc = document.URL.replace(/pages\/products\/search-prods.php(.*)/, "actions/products/getAllCatProducts.php?cid=" + category + "&page="+ page + "&ipp="+items_per_page);
    }
    else {
        var farray = JSON.stringify(activeFilters);
        if(category === undefined)
            loc = document.URL.replace(/pages\/products\/search-prods.php(.*)/, "actions/products/getFilteredProductswNamepart.php?s="+search+"&filters=" + farray + "&page="+ page + "&ipp="+items_per_page);
        else
           loc = document.URL.replace(/pages\/products\/search-prods.php(.*)/, "actions/products/getFilteredProductswCat.php?cat=" + category + "&filters="+farray + "&page="+ page + "&ipp="+items_per_page);
    }
    getProducts(loc);
}

$('.slider').noUiSlider({
    start: [ 20, 30 ],
    connect: true,
    range: {
        'min': 10,
        'max': 40
    },
    
    serialization: {
        lower: [
            $.Link({
                target: $("#pr1"),
                method: updateRange
            })
        ],
		upper: [
            $.Link({
                target: $("#pr2"),
                method: updateRange
            })
        ],
        format: {
            decimals: 0   
        }
    }
});

/*
$('.slider').on('slide', updateRange);
*/
function updateRange(value) {
     $(this).html(value+"€");
}