$(document).ready(function(){
                    $.each($('input'), function(){
                             if(/date/.test($(this).attr('id'))){
                               $(this).datepicker();
                             }
                           });
                  });