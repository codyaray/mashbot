class Photo < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :creator, :class_name => 'User'

  has_attached_file :image,
  :styles => { :large => "700x>",
    :medium => "300x300>",
    :thumb => "100x100>" }
end







# == Schema Information
#
# Table name: photos
#
#  id                 :integer         not null, primary key
#  caption            :string(255)
#  tags               :string(255)
#  permissions        :string(255)
#  optional_fields    :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  go_live            :datetime
#  sent               :boolean         default(FALSE)
#  creator_id         :integer
#  campaign_id        :integer
#

