class ScheduleController < ApplicationController
  before_filter :require_user
  def index
    @campaigns = Campaign.find(:all)
    @unscheduled_campaigns = []
    logger.info @campaigns.inspect
    @campaigns.each do |campaign|
      if campaign.start_date.nil? or campaign.start_date == ''
        @unscheduled_campaigns.push campaign
      end
    end
  end

end
