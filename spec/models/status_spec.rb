require 'spec_helper'

describe Status do
  before(:each) do
    @valid_attributes = {
      :campaign_id => 1,
      :message => "value for message",
      :creator_id => 1,
      :go_live => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Status.create!(@valid_attributes)
  end
end









# == Schema Information
#
# Table name: statuses
#
#  id          :integer(4)      not null, primary key
#  campaign_id :integer(4)
#  message     :string(255)
#  creator_id  :integer(4)
#  go_live     :datetime
#  created_at  :datetime
#  updated_at  :datetime
#  sent        :boolean(1)      default(FALSE)
#

