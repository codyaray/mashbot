class ScheduleController < ApplicationController
  before_filter :require_user
  def index
    @campaigns = Campaign.find(:all)
  end

end
