class DashboardController < ApplicationController
  before_filter :require_user ## Uncomment to session block this page

  def index
    @entries = AuthenticationCredential.all :conditions => {:service=>'Flickr', :user_id=>current_user.id}
    @service_accounts = ServiceAccount.all :conditions => {:user_id=>current_user.id}
    @consumer_tokens=ConsumerToken.all :conditions=>{:user_id=>current_user.id}
    @services=OAUTH_CREDENTIALS.keys-@consumer_tokens.collect{|c| c.class.service_name}
    @token_request_url = FlickRaw.auth_url :perms => 'write'
  end

end
