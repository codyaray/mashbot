ActionController::Routing::Routes.draw do |map|
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
