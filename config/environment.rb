# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install

  config.gem "twitter_oauth", :source => "http://gemcutter.org"
  config.gem "authlogic"
  config.gem "authlogic-oid", :lib => "authlogic_openid"
  config.gem "ruby-openid", :lib => "openid"
  config.gem "factory_girl", :source => "http://gemcutter.org"
  config.gem "oauth"
  config.gem "portablecontacts"
  config.gem "oauth-plugin"
  config.gem "rspec", :lib => "spec"
  config.gem "rspec-rails", :lib => "spec/rails"
  config.gem "cucumber"
  config.gem "cucumber-rails", :lib => "spec/rails"
  config.gem "capybara"
  config.gem "twitter"
  config.gem "paperclip"
  config.gem "hpricot"
  config.gem "haml"
  config.gem "treetop"
  config.gem "term-ansicolor"
  config.gem "rdiscount"
  config.gem "flickraw"
#  config.gem 'right_aws'  
  config.gem "aws-s3", :version => ">= 0.6.2", :lib => "aws/s3"
  config.time_zone = 'UTC'

end
