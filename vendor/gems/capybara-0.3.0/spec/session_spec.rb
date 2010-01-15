require File.expand_path('spec_helper', File.dirname(__FILE__))
require 'nokogiri'

shared_examples_for "session" do
  def extract_results(session)
    YAML.load Nokogiri::HTML(session.body).xpath("//pre[@id='results']").first.text
  end

  describe '#app' do
    it "should remember the application" do
      @session.app.should == TestApp
    end
  end

  describe '#visit' do
    it "should fetch a response from the driver" do
      @session.visit('/')
      @session.body.should include('Hello world!')
      @session.visit('/foo')
      @session.body.should include('Another World')
    end
  end
  
  describe '#body' do
    it "should return the unmodified page body" do
      @session.visit('/')
      @session.body.should include('Hello world!')
    end
  end
  
  describe '#source' do
    it "should return the unmodified page source" do
      @session.visit('/')
      @session.source.should include('Hello world!')
    end
  end

  it_should_behave_like "all"
  it_should_behave_like "attach_file"
  it_should_behave_like "check"
  it_should_behave_like "choose"
  it_should_behave_like "click"
  it_should_behave_like "click_button"
  it_should_behave_like "click_link"
  it_should_behave_like "fill_in"
  it_should_behave_like "find_button"
  it_should_behave_like "find_field"
  it_should_behave_like "find_link"
  it_should_behave_like "find"
  it_should_behave_like "has_content"
  it_should_behave_like "has_css"
  it_should_behave_like "has_css"
  it_should_behave_like "has_xpath"
  it_should_behave_like "select"
  it_should_behave_like "uncheck"
  it_should_behave_like "locate"
  it_should_behave_like "within"
  it_should_behave_like "current_url"
end


describe Capybara::Session do
  context 'with non-existant driver' do
    it "should raise an error" do
      running {
        Capybara::Session.new(:quox, TestApp).driver
      }.should raise_error(Capybara::DriverNotFoundError)
    end
  end
end
