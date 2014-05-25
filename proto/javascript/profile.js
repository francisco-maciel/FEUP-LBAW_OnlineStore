$(document).ready(function () {
    $("#change_password").click(function () {
        $(".change_password").slideToggle();
    });

    $("#edit_profile").click(function () {
        $('.form-horizontal').find('.form-control-update').each(function () {
            $("<input type='text' />").attr({ name:$(this).attr("name"), id:$(this).attr("id"), value: $(this).html() }).insertBefore(this);
        }).remove();

        $('.form-horizontal').find('#birthdate').each(function () {
            $(this).html('<div class="picker" id="picker"></div>');
        })

        $('#form-hide').hide();
        $('#button-edit').hide();
        $('#buttons_hide').show();

        $('.form-group #birthdate').hide();
        $('.form-group #picker').show()
    });

    $('#cancel_password').click(function () {
        $(".change_password").slideUp();
    })

    $('#confirmPassword').keyup(checkPasswordMatch);
    $('#password').keyup(checkPasswordMatch);
    $('#confirmPassword').change(checkPasswordMatch);
    $('#password').change(checkPasswordMatch);

    $('#profile_form').submit(checkForm);
    $('#change_password_form').submit(checkPassword);
})

function addError(error_text) {
    $('#error_messages').hide().append( "<div class='col-md-12 message error_message'><div class='panel panel-danger'><div class='panel-heading'><h3 class='panel-title'>"+error_text+"</h3><span class='pull-right clickable message-closer'><i class='glyphicon glyphicon-remove'></i></span></div> </div></div>");

}

function checkForm(event){
    var result = true;

    $('.error_message').remove();

    if (!check_date()) {

        addError('Please fill in your birthdate');
        result= false;
    }

    if (!check_nif()) {
        addError('The nif value you entered is not valid');
        result= false;
    }

    if (!result) {
        $('#error_messages').show('slow');
        $('html,body').animate({
                scrollTop: $("html").position().top},
            'slow');
        initMessageClosers();
    }
    return result;
}

function checkPassword(event){
    var result = true;

    $('.error_message').remove();

    if (!check_password_submit())  {

        addError('Please confirm your password');
        result = false;
    }

    if (!result) {
        $('#error_messages').show('slow');
        $('html,body').animate({
                scrollTop: $("html").position().top},
            'slow');
        initMessageClosers();
    }
    return result;
}

function checkPasswordMatch() {
    var password = $('#password').val();
    var confirmPassword = $('#confirmPassword').val();
    if (confirmPassword != '') {
        if (password != confirmPassword) {
            $('#confirmPassword').closest('div.form-group').removeClass('has-success').addClass('has-error');
            return false;
        }
        else {
            $('#confirmPassword').closest('div.form-group').removeClass('has-error').addClass('has-success');
            return true;
        }
    }
    return false;
}

function check_password_submit() {
    if (!checkPasswordMatch()) {
        //alert('Please make sure your passwords match');
        return false;
    }
    else return true;
}

function check_date() {

    if ($('.birth-day').val() == 0  ||
        $('.birth-month').val() == 0 ||
        $('.birth-year').val() == 0)
    {
        //alert('Please make sure you fill your birthdate');
        return false;
    }
    return true;
}

function check_nif() {
    var value = $('#nif').val();
    if (value.length != 9) return false;

    var nif = value.split("");

    var checksum = 0;
    checksum += parseInt(nif[7]) * 2;
    checksum += parseInt(nif[6]) * 3;
    checksum += parseInt(nif[5]) * 4;
    checksum += parseInt(nif[4]) * 5;
    checksum += parseInt(nif[3]) * 6;
    checksum += parseInt(nif[2]) * 7;
    checksum += parseInt(nif[1]) * 8;
    checksum += parseInt(nif[0]) * 9;

    var module = checksum % 11;

    if (module == 0 || module == 1) {
        return (parseInt(nif[8]) == 0);
    }
    else return (parseInt(nif[8]) == (11 - module));

}

// Date picking

$(document).ready(function(){
    var birthdate  = $('#birth').html().substr(0,10);
    $('#picker').birthdaypicker({
        dateFormat: 'littleEndian',
        monthFormat   : 'long',
        defaultDate: birthdate
    });
});

