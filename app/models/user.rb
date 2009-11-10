class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.openid_required_fields = [:nickname, :email]
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
