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

