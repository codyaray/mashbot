class Status < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :creator, :class_name => 'User'
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
#

