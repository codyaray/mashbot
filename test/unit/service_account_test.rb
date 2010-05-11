require 'test_helper'

class ServiceAccountTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end




# == Schema Information
#
# Table name: service_accounts
#
#  id         :integer         not null, primary key
#  service    :string(255)
#  login      :string(255)
#  password   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

