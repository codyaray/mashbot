$(document).ready(function(){
                    $.each($('input'), function(){
                             if(/date/.test($(this).attr('id'))){
                               $(this).datepicker();
                             }
                             if(/time/.test($(this).attr('id'))){
                               $(this).timepickr({
                                 handle: '#trigger-test',
                                 convention: 12 });
                             }
                           });
                  });