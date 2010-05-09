// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function noticeme(){
  $('#flash').fadeOut('fast', function(){
                        $('#flash').fadeIn();
                      });
}