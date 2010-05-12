class DashboardController < ApplicationController
##  before_filter :require_user ## Uncomment to session block this page
  def index
    @entries = AuthenticationCredential.all(:conditions => {:service => 'Flickr'})
    @service_accounts = ServiceAccount.all
    @consumer_tokens=ConsumerToken.all :conditions=>{:user_id=>current_user.id}
    @services=OAUTH_CREDENTIALS.keys-@consumer_tokens.collect{|c| c.class.service_name}
		@token_request_url = FlickRaw.auth_url :perms => 'write'    
  end

end
