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
				      if (/unit-\d+/.test(klass)){
					unit_id = klass.replace('unit-', '');
					break;
				      }
				    }
				    if (unit_id != undefined) {
				      // TODO: Make spinner to indicate
				      // event info is loading
				      $.getJSON('/campaigns/' + unit_id + '.json', {},
					       function(json){
						 $('#schedule').fullCalendar('renderEvent', json, true);
					       });
				    }
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
  this.init_json = function(json) {
    this.id = json.campaign.id;
    this.title = json.campaign.title;
    this.allDay = json.campaign.allDay;
    this.date = json.campaign.date;
    this.start = json.campaign.start;
    this.end = json.campaign.end;
    this.url = json.campaign.url;
    this.className = json.campaign.className;
    this.editable = json.campaign.editable;
    this.source = json.campaign.source;
  };
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