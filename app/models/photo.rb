class Photo < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :creator, :class_name => 'User'
  
  serialize :optional_fields, Hash
  serialize :permissions, Hash

  PERMISSION_KEYS = {'is_public' => 'Public', 'is_friend' => 'Friends', 'is_family' => 'Family'}
  OPTIONAL_KEYS = {'safety_level' => 'Safety Level', 'content_type' => 'Content Type', 'hidden' => 'Hidden'}
  SAFETY_LEVEL = {'1' => 'Safe', '2' => 'Moderate', '3' => 'Restricted'}
  CONTENT_TYPE = {'1' => 'Photo', '2' => 'Screenshot', '3' => 'Other'}
  HIDDEN = {'1' => 'Globally Searchable', '2' => 'Hidden'}
  has_attached_file :image,

  :styles => { :large => "700x>",
    :largest => "1000x>",
    :show => "400x>",
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
#  title              :string(255)
#

