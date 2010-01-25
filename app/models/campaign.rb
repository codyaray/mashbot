class Campaign < ActiveRecord::Base
  validate :must_end_after_start

  def must_end_after_start
    errors.add_to_base("Hold up! You can't end something before you start it!") unless end_date > start_date
  end
end


# == Schema Information
#
# Table name: campaigns
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  start_date :string(255)
#  end_date   :string(255)
#

