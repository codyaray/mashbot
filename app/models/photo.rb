class Photo < ActiveRecord::Base
  belongs_to :campaign
  belongs_to :creator, :class_name => 'User'

  # Require a title else the core will fail with
  # InvalidEntryException: Bad Request `Photo title cannot be empty`
  validates_presence_of :title
  
  serialize :optional_fields, Hash
  serialize :permissions, Hash

  PERMISSION_KEYS = {'is_public' => 'Public', 'is_friend' => 'Friends', 'is_family' => 'Family'}
  OPTIONAL_KEYS = {'safety_level' => 'Safety Level', 'content_type' => 'Content Type', 'hidden' => 'Hidden'}
  SAFETY_LEVEL = {'1' => 'Safe', '2' => 'Moderate', '3' => 'Restricted'}
  CONTENT_TYPE = {'1' => 'Photo', '2' => 'Screenshot', '3' => 'Other'}
  HIDDEN = {'1' => 'Globally Searchable', '2' => 'Hidden'}


  has_attached_file :image,
  :storage => :s3,
  :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
  :path => ":attachment/:id/:style/:basename.:extension",
  :bucket => 'mashbot',
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
#  id                 :integer(4)      not null, primary key
#  caption            :string(255)
#  tags               :string(255)
#  permissions        :string(255)
#  optional_fields    :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  go_live            :datetime
#  sent               :boolean(1)      default(FALSE)
#  creator_id         :integer(4)
#  campaign_id        :integer(4)
#  title              :string(255)
#

