class Post < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :creator, :class_name => 'User'
  
  def rendered_body
    renderer = RDiscount.new(self.body)
    renderer.to_html
  end
end






# == Schema Information
#
# Table name: posts
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  body        :text
#  go_live     :datetime
#  creator_id  :integer(4)
#  campaign_id :integer(4)
#  sent        :boolean(1)      default(FALSE)
#  tags        :string(255)
#  private     :boolean(1)
#  created_at  :datetime
#  updated_at  :datetime
#

