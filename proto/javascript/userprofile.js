/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function banUser(id) {
    var loc = document.URL.replace(/pages(.*)/, "actions/manage/banUser.php?id=" + id);
    $.get(loc, function() {
        //alert("Buyer banned");
        window.location.replace("http://localhost:4567/lbaw-loja-online/proto/pages/admin_area/manage_users.php?userBanned=1");
    }).fail(function(data) {
        alert("ERROR!\nWhat: Ban User\nWhy: " + data.statusText);
    });
}

$(document).ready(function() {
    $("#change").click(function() {
        $(".change").slideToggle();
    });
    $("#edit_profile").click(function() {
        $('.form-horizontal').find('.form-control-update').each(function() {
            $("<input type='text' />").attr({name: $(this).attr('name'), value: $(this).html()}).insertBefore(this);
        }).remove();
        $('.form-horizontal').find('#birthdate').each(function() {
            $(this).html('<div class="picker" id="picker"></div>');
        })

        $('#form-hide').hide();
        $('#button-edit').hide();
        $('#buttons_hide').show();
        $('.form-group #birthdate').hide();
        $('.form-group #picker').show()
    });
    $('#cancel_password').click(function() {
        $(".change").slideUp();
    })
});