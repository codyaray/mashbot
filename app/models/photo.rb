class Photo < ActiveRecord::Base
  has_attached_file :image,
  :styles => { :large => "700x>",
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
#

