class AuthenticationCredentialsController < ApplicationController
  def index
  end

  def twitter
    key =  'hj5zBtPPsgt232o0VVZeeA'
    secret = 'vASjnRHsClgVp7DsvRJaPBixXyirgJ2wcNEZUeTRF4'
    client = TwitterOAuth::Client.new(:consumer_key => key, :consumer_secret => secret)
    request_token = client.request_token(:oauth_callback => 'http://mashbot.dev/authentication_credentials/twitter')
    @token_request_url = request_token.authorize_url

    exists = false
    @existing = AuthenticationCredential.all(:conditions => {:service => 'Twitter'})
    if params[:oauth_token] and params[:oauth_verifier]
      access_token = 
        client.authorize(params[:oauth_token],
                         request_token.secret,
                         :oauth_verifier => params[:oauth_verifier])
      
      @existing.each do |a|
        matching_record = nil
        if a.details[:screen_name] == access_token.params[:screen_name]
          exists = true
          matching_record = a
        end
      end
      
      details = {
        :screen_name => access_token.params[:screen_name],
        :token => access_token.token,
        :key => key,
        :secret => access_token.secret
      }
      begin
        
        if not exists
          AuthenticationCredential.create!({:service => 'Twitter', :details => details})
        else
          matching_record.details = details
          matching_record.save!
        end
      rescue Exception => e
        flash[:notice] = "Something went wrong saving the credentials for Twitter.  Try again? #{e.inspect}" 
      else 
        flash[:notice] = "Awesome, we have credentials for Twitter stored away"
        @existing = AuthenticationCredential.all(:conditions => {:service => 'Twitter'}) # So we have the most recently stored one.
      end
      
    end

  end

end
