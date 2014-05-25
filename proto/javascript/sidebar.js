//!function ($) {

    // Le left-menu sign
    // for older jquery version
/*
    $('#filters').click(function () {
        $(this).find('i:first').toggleClass("glyphicon glyphicon-chevron-down"); 
    }); */
   /*
    $(document).on("click","#filters ul.nav li.parent > a > span.filter", function(){          
        $(this).find('i:first').toggleClass("glyphicon glyphicon-chevron-down");      
    }); 
*/
    // Open Le current menu
    //$("#left ul.nav li.parent.active > a > span.sign").find('i:first').addClass("icon-minus");
   // $("#left ul.nav li.current").parents('ul.children').addClass("in");

//}(window.jQuery);

    var activeFilters=[];
    var category = $('#cattitle').attr("catid");



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
                $('#filter'+id).after("<li class=\"filterson "+id+"\ filter=\""+id+"\" type=\""+obj.type+"\" value=\""+obj.value_string+"\"><a class=\"\" href=\"#\"><span class=\"glyphicon\"></span>"+ obj.value_string +"</a></li>");
            else
                $('#filter'+id).after("<li class=\"filterson "+id+"\ filter=\""+id+"\" type=\""+obj.type+"\" value=\""+obj.value_int+"\"><a class=\"\" href=\"#\"><span class=\"glyphicon\"></span>"+ obj.value_int +"</a></li>");
      });
        //$('#prod_category option[value=' + selected + ']').attr("selected", "selected");
    });
}


    $('li.filter').click(function() {
        var id = $(this).attr("fid");
        $(this).find("span").toggleClass('glyphicon-chevron-down glyphicon-chevron-right');
        if($(this).find("span").attr("class") === "glyphicon glyphicon-chevron-right")
            $('.filterson.'+id).remove();
        else
            loadFilterValues(id);
    });
    
    function include(id) {
        for(var x=0; x < activeFilters.length; x++) {
            if(activeFilters[x].fid === id)
                return x;
        }
        return -1;
    }

    $(document).on("click",'li.filterson', function() {
        $(this).find("a").toggleClass('active_selected');
        var fid = $(this).attr("filter");
        var i = include(fid);
        if(i===-1){
         var tp = $(this).attr("type");
         var val = $(this).attr("value");
         var filter = {id:fid, type:tp, value:val};
         activeFilters.push(filter);
        }
        else{
         activeFilters.splice(i,1);
        }
        filtering();
    });
    
   
    function filtering() {
        
        $('#results').empty();
    }