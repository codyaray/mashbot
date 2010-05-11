require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

