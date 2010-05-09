class Post < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :creator, :class_name => 'User'
end



# == Schema Information
#
# Table name: posts
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  body        :text
#  go_live     :datetime
#  creator_id  :integer
#  campaign_id :integer
#  sent        :boolean         default(FALSE)
#  tags        :string(255)
#  private     :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

