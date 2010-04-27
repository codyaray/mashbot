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

function submit_campaign(text, id){
  var post = {
    "campaign[title]": $('#campaign_title').val(),
    "campaign[start_date]": $('#campaign_start_date').val(),
    "campaign[end_date]": $('#campaign_end_date').val(),
    authenticity_token: $("input[name=authenticity_token]").val(),
    _method: $("input[name=_method]").val()
  };
  var action = $('form').attr('action');
  $.ajax({
           url: action,
           data: post,
           dataType: 'json',
           type: 'POST',
           success: function(json){
             $('#flash').html(json.message);
             $(document).trigger('close.facebox');
           }
         });
}