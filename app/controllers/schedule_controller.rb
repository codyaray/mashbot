class ScheduleController < ApplicationController
  before_filter :require_user
  def index
    @campaigns = Campaign.find(:all)
    @unscheduled_campaigns = []
    @campaigns.each do |campaign|
      if campaign.start_date.nil?
        @unscheduled_campaigns.push 
      end
    end
  end

end
