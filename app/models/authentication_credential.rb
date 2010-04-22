class AuthenticationCredential < ActiveRecord::Base
  serialize :details, Hash
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

