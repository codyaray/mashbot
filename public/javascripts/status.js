$(document).ready(function(){
                    calculate_characters();
                  });

function calculate_characters() {
  var length = 140-$('#status_message').val().length;
  var charr = $('#characters');
  charr.html(length);
  if (length < 20) {
    charr.addClass('fewremaining');
    charr.removeClass('normal');
  } else {
    charr.addClass('normal');
    charr.removeClass('fewremaining');
  }
  if (length < 0) {
    $('.status').addClass('overloaded');
  } else {
    $('.status').removeClass('overloaded');
  }
}