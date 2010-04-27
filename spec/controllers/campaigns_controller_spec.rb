require 'spec_helper'

describe CampaignsController do

  it "should display all of the scheduled campaigns in a json feed" do
    campaigns = []
    10.times do |i|
      campaigns << Factory.create(:campaign)
    end
    controller.scheduled_campaigns.should == ""
  end
  
end
