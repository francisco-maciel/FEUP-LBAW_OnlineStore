var activeFilters=[];
var category = $('#cattitle').attr("catid");
var search = $('#searchtitle').attr("search");
var openfilters=[];


function loadFilterValues(id) {
    //selected = selected || 1;
    //$('#prod_category').empty();
    var loc = document.URL.replace(/pages\/products\/search-prods.php(.*)/, "actions/products/getFilterValues.php?id=" + id);
    $.ajax({
        url: loc,
        context: document.body,
        dataType: "json"
    }).done(function(data) {
        data.forEach(function(obj) {
            //var myObject = JSON.stringify(obj);
            //alert(myObject);
            if(obj.type===0)
                $('#filter'+id).after("<li class=\"filterson "+id+"\" filter=\""+id+"\" type=\""+obj.type+"\" value=\""+obj.value_string+"\"><a class=\"\" href=\"#\"><span class=\"glyphicon\"></span>"+ obj.value_string +"</a></li>");
            else
                $('#filter'+id).after("<li class=\"filterson "+id+"\" filter=\""+id+"\" type=\""+obj.type+"\" value=\""+obj.value_int+"\"><a class=\"\" href=\"#\"><span class=\"glyphicon\"></span>"+ obj.value_int +"</a></li>");
        });
        //$('#prod_category option[value=' + selected + ']').attr("selected", "selected");
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


$('li.filter').click(function() {
    var id = $(this).attr("fid");
    $(this).find("span").toggleClass('glyphicon-chevron-down glyphicon-chevron-right');
    if(openfilters.indexOf(id)===-1) {
        loadFilterValues(id);
        openfilters.push(id);
    }
    else
        $('.filterson.'+id).toggle();
});


function include(id) {
    for(var x=0; x < activeFilters.length; x++) {
        if(activeFilters[x].id === id)
            return x;
    }
    return -1;
}

$(document).on("click",'li.filterson', function() {
    //falta verificar se já está activado outro valor p o mesmo filtro
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
        // var filter = {id:fid, type:tp, value:val};
        
        activeFilters.push({id:fid, type:tp, value:val});
    }
    else{
        activeFilters.splice(i,1);
    }
    //alert(JSON.stringify(activeFilters));
    filtering();
});


function filtering() {
    //se activeFilters = vazio -> pesquisa categoria
    //senao, forma query e faz pedido à bd
    //apaga produtos e insere novo resultado
    //se sem resultados, mostrar mensagem
    var loc;
    if(activeFilters.length===0) {
        if(category === undefined)
            loc = document.URL.replace(/pages\/products\/search-prods.php(.*)/, "actions/products/getAllSearchProducts.php?s=" + search);
        else
            loc = document.URL.replace(/pages\/products\/search-prods.php(.*)/, "actions/products/getAllCatProducts.php?cid=" + category);
    }
    else {
        if(category === undefined) {
            var q = "select q1.* from ";
            for(var i=0; i < activeFilters.length; i++) {
                if(i>0)
                    q+=" INNER JOIN ";
                
                if(activeFilters[i].type === 0)
                    q=q+"(select product.* from product INNER JOIN prodfilter ON product.idproduct = prodfilter.idproduct WHERE LOWER(product.title) LIKE LOWER('%"+search+"%') AND prodfilter.idfilter = "+ activeFilters[i].id + " AND prodfilter.value_string = '" + activeFilters[i].value + "' ) as q"+(i+1)+" ";
                else 
                    q=q+"(select product.* from product INNER JOIN prodfilter ON product.idproduct = prodfilter.idproduct WHERE LOWER(product.title) LIKE LOWER('%"+search+"%') AND prodfilter.idfilter = "+ activeFilters[i].id + " AND prodfilter.value_int = " + activeFilters[i].value+" ) as q"+(i+1)+" ";
                
                if(i>0)
                    q+="ON q1.idproduct = q"+(i+1)+".idproduct ";  
            }
        }
        else {
            var q = "select q1.* from ";
            for(var i=0; i < activeFilters.length; i++) {
                if(i>0)
                    q+=" INNER JOIN ";
                if(activeFilters[i].type === 0){
                    q=q+"(select product.* from product INNER JOIN category cat ON cat.idcategory = product.idcategory INNER JOIN prodfilter ON product.idproduct = prodfilter.idproduct WHERE cat.idcategory = "+ category +" AND prodfilter.idfilter = "+ activeFilters[i].id + " AND prodfilter.value_string = '" + activeFilters[i].value + "' ) as q"+(i+1)+" ";
                } else {
                    q=q+"(select product.* from product INNER JOIN category cat ON cat.idcategory = product.idcategory INNER JOIN prodfilter ON product.idproduct = prodfilter.idproduct WHERE cat.idcategory = "+ category +" AND prodfilter.idfilter = "+ activeFilters[i].id + " AND prodfilter.value_int = " + activeFilters[i].value+" ) as q"+(i+1)+" ";
                }
                if(i>0)
                    q+="ON q1.idproduct = q"+(i+1)+".idproduct ";
            }
        }
        loc = document.URL.replace(/pages\/products\/search-prods.php(.*)/, "actions/products/getFilteredProducts.php?q=" + q);
    }
    getProducts(loc);
}


function listProduct(obj) {
    var result = "<div class=\"col-sm-4 col-lg-4 col-md-4\"><div class=\"thumbnail\">";
    if(obj.img)
        result+="<a href=\""+base_url+"pages/products/product.php?id="+obj.idproduct+"\"> <img style=\"min-height:200px; max-height:200px; width:auto;\" class=\"img-responsive\" src=\""+base_url+"images/products/"+obj.img+"\" alt=\"\"> </a>";
    else
        result+="<a href=\""+base_url+"pages/products/product.php?id="+obj.idproduct+"\"> <img class=\"img-responsive\" src=\""+base_url+"images/products/default.png\" alt=\"\"> </a>";    
    
    if(obj.title.length>28)
        result+="<h4> <a href=\""+base_url+"pages/products/product.php?id="+obj.idproduct+"\">"+(obj.title).substr(0,28)+"</a> </h4>";
    else   
        result+="<h4> <a href=\""+base_url+"pages/products/product.php?id="+obj.idproduct+"\">"+obj.title+"</a> </h4>";    
    
    result+="<div class=\"caption\"><h4 class=\"pull-right\">€"+obj.price+"</h4>";
    result+="</div><div class=\"ratings\">"+
            "<p class=\"pull-right\">15 reviews</p><p>"+
            "<span class=\"glyphicon glyphicon-star\"></span>\n"+
            "<span class=\"glyphicon glyphicon-star\"></span>\n"+
            "<span class=\"glyphicon glyphicon-star\"></span>\n"+
            "<span class=\"glyphicon glyphicon-star\"></span>\n"+
            "<span class=\"glyphicon glyphicon-star\"></span>\n"+
            "</p></div></div><br></div>";
    
    $('#results').append(result);
}