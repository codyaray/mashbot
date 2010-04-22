require 'spec_helper'

describe AuthenticationCredentialsController do

  #Delete these examples and add some real ones
  it "should use AuthenticationCredentialsController" do
    controller.should be_an_instance_of(AuthenticationCredentialsController)
  end


  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'twitter'" do
    it "should be successful" do
      get 'twitter'
      response.should be_success
    end
  end
end
