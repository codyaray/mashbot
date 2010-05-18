# edit this file to contain credentials for the OAuth services you support.
# each entry needs a corresponding token model.
#
# eg. :twitter => TwitterToken, :hour_feed => HourFeedToken etc.
#
# OAUTH_CREDENTIALS={
#   :twitter=>{
#     :key=>"",
#     :secret=>""
#   },
#   :google=>{
#     :key=>"",
#     :secret=>"",
#     :scope=>"" # see http://code.google.com/apis/gdata/faq.html#AuthScopes
#   },
OAUTH_CREDENTIALS={ 
  :twitter=>{
    :key=>"wOrsK4bFG0VJNplruzVoNg",
    :secret=>"E3akoP3oG8iQj1XHP9bArQSwlCKfyedPNaFX4U8vd4"
  },
  :google=>{ 
    :key=>"www.mashbot.net", 
    :secret=>"gQm5ijNqtZ6qwuWpRbENKdso",
    :scope=>"http://www.blogger.com/feeds/ http://picasaweb.google.com/data/",
    :site => "http://www.google.com",
    :request_token_path => "/accounts/OAuthGetRequestToken", 
    :access_token_path => "/accounts/OAuthGetAccessToken", 
    :authorize_path=> "/accounts/OAuthAuthorizeToken"  
  },
  :facebook=>{
    :key=>"3d07fa3a51a6771dc2b5aab732ad0987",
    :secret=>"928ab894330d2599d8cb8d2d286023bd",
    :options=>{
      :site=>"http://graph.facebook.com",
      :authorize_path=>"/oauth/authorize",
      :request_token_path=>"/oauth/request_token",
      :access_token_path=>"/oauth/access_token"
    }
  }
}
#   :agree2=>{
#     :key=>"",
#     :secret=>""
#   },
#   :fireeagle=>{
#     :key=>"",
#     :secret=>""
#   },
#   :hour_feed=>{
#     :key=>"",
#     :secret=>"",
#     :options=>{ # OAuth::Consumer options
#       :site=>"http://hourfeed.com" # Remember to add a site for a generic OAuth site
#     }
#   },
#   :nu_bux=>{
#     :key=>"",
#     :secret=>"",
#     :super_class=>"OpenTransactToken",  # if a OAuth service follows a particular standard 
#                                         # with a token implementation you can set the superclass
#                                         # to use
#     :options=>{ # OAuth::Consumer options
#       :site=>"http://nubux.heroku.com" 
#     }
#   }
# }
# 
OAUTH_CREDENTIALS={
} unless defined? OAUTH_CREDENTIALS

load 'oauth/models/consumers/service_loader.rb'