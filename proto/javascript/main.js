BASE_URL = '...';


$(document).ready(function(){
    initMessageClosers();
});

function initMessageClosers() {
  $('.message-closer').click(function() {
    $(this).closest(".message").hide('slow');
  });
}


function clearText(id) {
    var element = document.getElementById(id);
    element.innerHTML = ""; 
}

var count = 1;
function appendToForm(id){
    var name = "<label class='col-md-4 control-label' for='attr'>Atribute name "+count+"</label>"+
            "<div class='col-md-4'>"+
            "<input id='attr_name"+count+"' name='attr_name"+count+"' type='text' placeholder='Atribute name' class='form-control input-md'>"+
            "</div>";
    var value = "<label class='col-md-4 control-label' for='attr'>Atribute value "+count+"</label>"+
            "<div class='col-md-4'>"+
            "<input id='attr_value"+count+"' name='attr_value"+count+"' type='text' placeholder='Atribute value' class='form-control input-md'>"+
            "</div>";
    $('.form-group + #'+id).before($('<div class="form-group"></div>').html(name));
    $('.form-group + #'+id).before($('<div class="form-group"></div>').html(value));
    count ++;

}