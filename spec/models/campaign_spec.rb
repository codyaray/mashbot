

describe Campaign, "#to_fullcalendar_event" do
  it "translates a campaign object to a fullcalendar style object" do
    campaign = Campaign.new({:title => 'Awesome Campaign', :start_date => 2.days.from_now, :end_date => 3.days.from_now})
    fc_campaign = campaign.to_fullcalendar_event
    fc_campaign.title.should == 'Awesome Campaign'
    fc_campaign.start_date.should == 2.days.from_now
    fc_campaign.end_date.should == 2.days.from_now
  end
end






# == Schema Information
#
# Table name: campaigns
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  start_date :string(255)
#  end_date   :string(255)
#

