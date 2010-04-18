# app/controllers/application.rb
class ApplicationController < ActionController::Base  
  include AuthenticationHelper
  layout proc{ |c| c.request.xhr? ? false : "application" }  
  before_filter :determine_ajax
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user

  private
  def determine_ajax
    @xhr = request.xhr?
  end
end
