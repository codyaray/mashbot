function init_schedule(){
  $('#schedule').fullCalendar({
                                events: '/campaigns/scheduled',
                                editable: true,
                                eventClick: function( event, jsEvent, view ) {
                                  $.facebox(function(){
                                              $.get('/campaigns/' + event.id + '/edit', function(data){
                                                      $.facebox(data);
                                                });

                                            });
                                }
                              });
  $('#accordion').accordion();
}

$(document).ready(function(){
                    $(document).bind('close.facebox', function(){
                             $('#schedule').fullCalendar('refetchEvents');
                           });
                          });



