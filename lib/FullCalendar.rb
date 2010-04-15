module FullCalendar
  class Event < Struct.new(:id, :title, :start, :end, :url, :allDay, :className, :editable, :source)
    def initialize campaign
      self.id = campaign.id
      self.title = campaign.title
      self.start = campaign.start_date
      self.end = campaign.end_date
      self.url = ''
      self.allDay = true
      self.className = ''
      self.editable = true
      self.source = ''
    end
    def to_hash
      hash = {}
      self.each_pair {|key, val| hash.store key, val}
      hash
    end
  end
end
