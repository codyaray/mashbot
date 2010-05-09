require 'spec_helper'

describe AuthenticationCredential do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    AuthenticationCredential.create!(@valid_attributes)
  end
end





# == Schema Information
#
# Table name: authentication_credentials
#
#  id         :integer(4)      not null, primary key
#  service    :string(255)     not null
#  details    :string(255)     not null
#  created_at :datetime
#  updated_at :datetime
#

