module FullCalendar
  class Event < Struct.new(:id, :title, :start, :end, :url, :allDay, :className, :editable, :source)
    def initialize xid, xtitle, xstart, xend, xurl, xallDay, xclassName, xeditable, xsource
      @id = xid
      @title = xtitle
      @start = xstart
      @end = xend
      @url = xurl
      @allDay = xallDay
      @className = xclassName
      @editable = xeditable
      @source = xsource
    end
  end
end
