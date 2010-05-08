class ServiceAccount < ActiveRecord::Base
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
#

