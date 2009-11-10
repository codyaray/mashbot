# app/models/notifier.rb  
class Notifier < ActionMailer::Base
  default_url_options[:host] = "mashbot.net"  
  
  def password_reset_instructions(user)
    subject       "Password Reset Instructions"
    from          "Mashbot Campaign Notifier "
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end 
end