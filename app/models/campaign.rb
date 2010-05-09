class Campaign < ActiveRecord::Base
  require 'FullCalendar'
  validate :must_end_after_start, :must_have_start_if_have_end
  validates_presence_of :title

  has_many :statuses
  has_many :photos

  def must_end_after_start
    if (!end_date.nil? and !start_date.nil?) and
      (end_date != '' and start_date != '') and
      Time.parse(end_date) < Time.parse(start_date)
      errors.add_to_base("Hold up! You can't end something before you start it!")
    end
  end
  
  def must_have_start_if_have_end
    if (!end_date.nil? and end_date != '') and (start_date == '' or !start_date.nil?)
      # errors.add_to_base("#{start_date} - #{end_date} | You're going to need a start date if you intend to have an end date")
    end
  end

  def to_fullcalendar_event 
    return FullCalendar::Event.new self
  end
end










# == Schema Information
#
# Table name: campaigns
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  start_date :string(255)
#  end_date   :string(255)
#

