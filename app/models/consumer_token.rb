require 'oauth/models/consumers/token'
class ConsumerToken < ActiveRecord::Base
  include Oauth::Models::Consumers::Token
  
end

# == Schema Information
#
# Table name: consumer_tokens
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  type       :string(30)
#  token      :string(1024)
#  secret     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

