function init_schedule(){
  $('#schedule').fullCalendar({});
  $('#accordion').accordion();
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
this.id = undefined;
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