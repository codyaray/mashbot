class User < ActiveRecord::Base
  has_many :client_applications
  has_one :google, :class_name=>"GoogleToken", :dependent=>:destroy
  has_one :twitter, :class_name=>"TwitterToken", :dependent=>:destroy
  has_many :tokens, :class_name=>"OauthToken",:order=>"authorized_at desc",:include=>[:client_application]
  has_many :statuses
  has_many :service_accounts
  has_many :authentication_credentials
  
  acts_as_authentic do |c|
    c.openid_required_fields = [:nickname, :email]
  end
  
  def tumblr
    return ServiceAccount.find(:first, :conditions => ['service = ? and user_id = ?', 'tumblr', self.id])
  end
  
  def flickr
    return AuthenticationCredential.find(:first, :conditions => ['service = ? and user_id = ?', 'flickr', self.id])
  end
  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)  
  end
  
  private
    def map_openid_registration(registration)
      self.login = registration["nickname"] if login.blank?
      self.email = registration["email"] if email.blank?
    end
end















# == Schema Information
#
# Table name: users
#
#  id                  :integer(4)      not null, primary key
#  login               :string(255)
#  email               :string(255)     not null
#  crypted_password    :string(255)
#  password_salt       :string(255)
#  persistence_token   :string(255)     not null
#  single_access_token :string(255)     not null
#  perishable_token    :string(255)     not null
#  login_count         :integer(4)      default(0), not null
#  failed_login_count  :integer(4)      default(0), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  openid_identifier   :string(255)
#  company             :string(255)
#

