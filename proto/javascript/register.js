$(document).ready(function() {
    $("#confirmPassword").keyup(checkPasswordMatch);
    $("#password").keyup(checkPasswordMatch);
    $("#confirmPassword").change(checkPasswordMatch);
    $("#password").change(checkPasswordMatch);

    $("#register_form").submit(checkForm);



});
function checkForm(event){
        var result = true;
    if (!check_password_submit(event))  {

        alertify.error("passwords dont match!");
        result = false;
    }

    if (!check_date(event)) {

        alertify.error("You must fill your birthdate!");
        result= false;
    }

    return result;
}
function checkPasswordMatch() {
    var password = $("#password").val();
    var confirmPassword = $("#confirmPassword").val();
    if (confirmPassword != "") {
        if (password != confirmPassword) {
            $("#confirmPassword").closest("div.form-group").removeClass("has-success").addClass("has-error");
            return false;
        }
        else {
            $("#confirmPassword").closest("div.form-group").removeClass("has-error").addClass("has-success");
            return true;
        }
    }
    return false;
}


function check_password_submit(event) {
    if (!checkPasswordMatch()) {
        //alert("Please make sure your passwords match");
        return false;
    }
    else return true;
}

function check_date() {

    if ($(".birth-day").val() == 0  ||
        $(".birth-month").val() == 0 ||
        $(".birth-year").val() == 0)
    {
        //alert("Please make sure you fill your birthdate");
        return false;
    }
    return true;
}

// Date picking

$(document).ready(function(){
    $("#picker").birthdaypicker({
        dateFormat: "littleEndian",
        monthFormat   : "long",
        defaultDate: false
    });
});
