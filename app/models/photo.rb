class Photo < ActiveRecord::Base
end

# == Schema Information
#
# Table name: photos
#
#  id              :integer(4)      not null, primary key
#  caption         :string(255)
#  tags            :string(255)
#  permissions     :string(255)
#  optional_fields :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

