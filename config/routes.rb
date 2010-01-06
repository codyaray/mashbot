ActionController::Routing::Routes.draw do |map|

  map.resource :user_session
  #map.root :controller => "user_sessions", :action => "new" # optional, this just sets the root route

  map.resource :account, :controller => :users
  map.resources :users

  map.register 'register', :controller => 'users', :action => "new"
  map.login 'login', :controller => 'user_sessions', :action => "new"
  map.logout 'logout', :controller => 'user_sessions', :action => "destroy"

  map.resources :password_resets

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.comatose_admin 

  map.comatose_root ''
end
