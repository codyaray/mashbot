require 'oauth/models/consumers/token'
class ConsumerToken < ActiveRecord::Base
  include Oauth::Models::Consumers::Token
  
end


# == Schema Information
#
# Table name: consumer_tokens
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  type       :string(30)
#  token      :string(1024)
#  secret     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

