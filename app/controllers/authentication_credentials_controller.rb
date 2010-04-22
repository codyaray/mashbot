class AuthenticationCredentialsController < ApplicationController
  def index
  end

  def twitter
    client = TwitterOAuth::Client.new(
                                      :consumer_key => 'hj5zBtPPsgt232o0VVZeeA',
                                      :consumer_secret => 'vASjnRHsClgVp7DsvRJaPBixXyirgJ2wcNEZUeTRF4'
                                      )
    request_token = client.request_token(:oauth_callback => 'http://mashbot.dev/authentication_credentials/twitter')
    @token_request_url = request_token.authorize_url

    if params[:oauth_token] and params[:oauth_verifier]
      access_token = 
        client.authorize(params[:oauth_token],
                         request_token.secret,
                         :oauth_verifier => params[:oauth_verifier])
      AuthenticationCredential.create({:service => 'Twitter', :details => {:token => access_token}})
      
    end

  end

end
