class Status < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :creator, :class_name => 'User'
end




# == Schema Information
#
# Table name: statuses
#
#  id          :integer         not null, primary key
#  campaign_id :integer
#  message     :string(255)
#  creator_id  :integer
#  go_live     :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

