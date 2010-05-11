$(document).ready(function(){
                    $('#go_live_time').timepickr({
                                                   handle: '.timehandle',
                                                   convention: 12
                                                 });
                  });

$(document).mousemove(function(){
                        var left = $('#go_live_time').position().left;
                        $('.ui-timepickr').css('left', left);
                      });