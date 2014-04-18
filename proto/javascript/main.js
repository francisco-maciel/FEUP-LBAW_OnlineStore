BASE_URL = '...';

$(document).ready(function(){
  initMessageClosers();
});

function initMessageClosers() {
  $('.message-closer').click(function() {
    $(this).closest(".message").fadeOut();
  });
}

