class ScheduleController < ApplicationController
  def index
    @campaigns = Campaign.find(:all)
  end

end
