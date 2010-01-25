function init_schedule(){
  $('#schedule').fullCalendar({});
  $('#accordion').accordion();
  add_draggable_to_unscheduled_units();
}

function add_draggable_to_unscheduled_units(){
  $('.schedule-unit').draggable({
				  start: function(event, ui){
				    var classes = ui.helper.attr('class').split(/\s/);
				    var klass = undefined;
				    var unit_id = undefined;
				    for (var i = 0; i < classes.length; i++) {
				      klass = classes[i];
				      if (/unit\d+/.test(klass)){
					unit_id = klass.replace('unit', '');
					break;
				      }
				    }
				    if (unit_id != undefined) {
				      // TODO: Make spinner to indicate
				      // event info is loading
				      $.getJSON('/exampleEvent', { id: unit_id },
					       function(json){
						 $('#schedule').fullCalendar('renderEvent', json, true);
					       });
				    }
				    // for (i in ui['helper']) {
				    //   $('body').append(i + ': ' + ui['helper'][i] + '<br />');
				    // }
				  }
				});

}

/**
 * @cfg id : integer or string
 * @cfg title : string
 * @cfg allDay : boolean
 * @cfg date : Date
 * @cfg start : Date
 * @cfg end : Date
 * @cfg url : string
 * @cfg className : string
 * @cfg editable : boolean
 * @cfg source : reference to data structure event came from
 */
function CalEvent(config) {
  this.id = undefined;
  this.title = undefined;
  this.allDay = true;
  this.date = undefined;
  this.start = undefined;
  this.end = undefined;
  this.url = undefined;
  this.className = undefined;
  this.editable = undefined;
  this.source = undefined;
  this.init = function(config) {
    this.id = config.id;
    this.title = config.title;
    this.allDay = config.allDay;
    this.date = config.date;
    this.start = config.start;
    this.end = config.end;
    this.url = config.url;
    this.className = config.className;
    this.editable = config.editable;
    this.source = config.source;
  };

  this.init(config);
}