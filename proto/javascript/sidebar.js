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
            var myObject = JSON.stringify(obj);
            //alert(myObject);
            if(obj.type==0)
                $('#filter'+id).after("<li><a><span class=\"glyphicon\"></span>"+ obj.value_string +"</a></li>");
            else
                $('#filter'+id).after("<li><a><span class=\"glyphicon\"></span>"+ obj.value_int +"</a></li>");

      });
        //$('#prod_category option[value=' + selected + ']').attr("selected", "selected");
    });
}

$(document).ready(function() {
    $('li.filter').click(function() {
        $(this).find("span").toggleClass('glyphicon-chevron-down glyphicon-chevron-right');
        loadFilterValues($(this).attr("fid"));
        //$('#aqui').append("<li>  <a><span></span> YEAH</a></li>");
    });
});