$(document).ready(function() {
    $("#confirmPassword").keyup(checkPasswordMatch);
    $("#password").keyup(checkPasswordMatch);
    $("#confirmPassword").change(checkPasswordMatch);
    $("#password").change(checkPasswordMatch);


    $("#register_form").submit(check_password_submit)
});

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
        alert("Please make sure your passwords match");
        return false;
    }
    else return true;
}