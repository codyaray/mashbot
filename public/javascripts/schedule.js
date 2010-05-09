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
                                },
                                eventDrop: function( event, dayDelta, minuteDelta, allDay, revertFunc, jsEvent, ui, view) {
                                  var post = {
                                    "campaign[title]": event.title,
                                    "campaign[start_date]": format_datetime(event.start),
                                    "campaign[end_date]": format_datetime(event.end),
                                    _method: 'put'
                                  };
                                  var action = 'campaigns/' + event.id;
                                  submit_campaign({post: post, action: action});
                                  noticeme();
                                },
                                eventResize: function( event, dayDelta, minuteDelta, revertFunc, jsEvent, ui, view ) {
                                var post = {
                                    "campaign[title]": event.title,
                                    "campaign[start_date]": format_datetime(event.start),
                                    "campaign[end_date]": format_datetime(event.end),
                                    _method: 'put'
                                  };
                                  var action = 'campaigns/' + event.id;
                                  submit_campaign({post: post, action: action});
                                  noticeme();
                                }
                              });
  $('#accordion').accordion();
}

$(document).ready(function(){
                    $(document).bind('close.facebox', function(){
                                       $('#schedule').fullCalendar('refetchEvents');
                                     });
                  });

function submit_campaign(posted){
  if (posted !== undefined) {
    var post = posted.post;
    var action = posted.action;
  } else {
    var post = {
      "campaign[title]": $('#campaign_title').val(),
      "campaign[start_date]": $('#campaign_start_date').val(),
      "campaign[end_date]": $('#campaign_end_date').val(),
      authenticity_token: $("input[name=authenticity_token]").val(),
      _method: $("input[name=_method]").val()
    };
    var action = $('form').attr('action');
  }
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

function format_datetime(date){
  return date.getFullYear() + '-' + pad((date.getMonth()+1), 2) + '-' + pad(date.getDate(), 2) + ' ' + pad(date.getHours(), 2) + ':' + pad(date.getMinutes(),2) + ':' + pad(date.getSeconds(), 2);
}

function pad(number, length) {

    var str = '' + number;
    while (str.length < length) {
        str = '0' + str;
    }

    return str;

}