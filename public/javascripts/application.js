// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function noticeme(){
  $('#flash').animate({left: '+=5'}, 500, function(){
                        $('#flash').animate({left: '-=3'}, 500, 'linear');
                      });
}

$(document).ready(function(){
                    noticeme();
                  });