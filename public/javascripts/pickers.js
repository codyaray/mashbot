$(document).ready(function(){
                    $('#go_live_time').timepickr({
                                                   handle: '.timehandle',
                                                   convention: 12
                                                 });
                  });

$(document).mousemove(function(){
                        var left = $('#go_live_time').position().left;
                        var top = $('#go_live_time').position().top + 60;
                        $('.ui-timepickr').css('left', left);
                        $('.ui-timepickr').css('top', top);
                        $('.ui-timepickr').css('z-index', 1000);
                      });