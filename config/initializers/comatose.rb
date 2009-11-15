Comatose.configure do |config|
  # admin -sets the text in the Admin UI's title area
  config.admin_title = "Mashbot"
  config.admin_sub_title = "Campaign Manager"

  # Includes authentication stuff in the ComatoseController
  config.includes << Authlogic::ActsAsAuthentic
  config.includes << :authentication_helper
  
  # Includes authentication stuff in the ComatoseAdminController
  config.admin_includes << Authlogic::ActsAsAuthentic
  config.admin_includes << :authentication_helper
    
  # Calls :require_user as a before_filter
  config.admin_authorization = :require_user

  # Returns the author name (login, in this case) for the current user
  config.admin_get_author do
    current_user.login
  end
end