require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
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

