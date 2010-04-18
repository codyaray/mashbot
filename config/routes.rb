ActionController::Routing::Routes.draw do |map|
  map.resources :oauth_consumers,:member=>{:callback=>:get}

  map.resources :oauth_clients

  map.test_request '/oauth/test_request', :controller => 'oauth', :action => 'test_request'
  map.access_token '/oauth/access_token', :controller => 'oauth', :action => 'access_token'
  map.request_token '/oauth/request_token', :controller => 'oauth', :action => 'request_token'
  map.authorize '/oauth/authorize', :controller => 'oauth', :action => 'authorize'
  map.oauth '/oauth', :controller => 'oauth', :action => 'index'
  map.connect 'campaigns/scheduled', :controller => 'campaigns', :action => 'scheduled'
  map.resources :campaigns


  map.resource :user_session
  map.root :controller => "dashboard"

  map.resource :account, :controller => :users
  map.resources :users

  map.resource :campaign

  map.register 'register', :controller => 'users', :action => "new"
  map.login 'login', :controller => 'user_sessions', :action => "new"
  map.logout 'logout', :controller => 'user_sessions', :action => "destroy"

  map.resources :password_resets

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.comatose_admin 

  map.comatose_root ''
end
