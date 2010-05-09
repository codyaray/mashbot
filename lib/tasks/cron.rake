require 'net/http'

task :cron => :environment do
  # check database for things with time to go_live <= Time.now
  statuses = Status.find(:all, :conditions => ['go_live <= ? and sent = ?', Time.now, false], :order => 'go_live DESC')
  posts = Post.find(:all, :conditions => ['go_live <= ? and sent = ?', Time.now, false], :order => 'go_live DESC')
  photos = Photo.find(:all, :conditions => ['go_live <= ? and sent = ?', Time.now, false], :order => 'go_live DESC')

  # send authentication info for all necessary accounts

  users = {}
  for item in [statuses, photos, posts].flatten!
    user = item.creator
    users = users.merge({user => []}) if not users.include?(user)
    users[user] << item
  end
  
  # group auth by user
  for user in users.keys
    if user.twitter
      token = user.twitter.client.client.access_token.token
      secret = user.twitter.client.client.access_token.secret
      twitterEntry = buildAuthInfoEntry(:twitter, :oauth, token, secret)
    end

    if user.blogger
      token = user.blogger.client.client.access_token.token
      secret = user.blogger.client.client.access_token.secret
      bloggerEntry = buildAuthInfoEntry(:blogger, :oauth, token, secret)
    end

    if user.tumblr
      email = user.tumblr.login
      password = user.tumblr.password
      tumblrEntry = buildAuthInfoEntry(:tumblr, :userpass, email, password)
    end
    
    if user.flickr
      email = user.flickr.login
      password = user.flickr.password
      flickrEntry = buildAuthInfoEntry(:flickr, :userpass, email, password)
    end
    
    entries = [twitterEntry, bloggerEntry, tumblrEntry, flickrEntry].compact!
    if entries.length > 0
      authinfo = buildAuthInfo entries
      #uuid = pushAuthInfo(authinfo)
      print authinfo
    end

    # loop over all things scheduled for now, send each item to the PAAP, and mark as sent
    for status in users[user]
      mobject = buildStatusMObject(status.message)
      pushMObject('status',mobject,uuid)
      # status.mark_as_sent
    end
  end
end

def pushAuthInfo authinfo
  http = Net::HTTP.new('ws35.cs.drexel.edu', 8080)
  path = '/mashbot/rest/auth'

  # POST request -> push status
  data = authinfo
  headers = {
    'Content-Type' => 'application/json',
    'Authorization' => "Basic #{Base64.b64encode("default:default")}"
  }

  # receive UUID as (json) string

  resp, data = http.post(path, data, headers)
  
  return data # UUID token
end

def pushMObject type, mobject, uuid
  http = Net::HTTP.new('ws35.cs.drexel.edu', 8080)
  path = '/mashbot/rest/' + type + '?token=' + uuid

  # POST request -> push mobject
  data = mobject
  headers = {
    'Content-Type' => 'application/json',
    'Authorization' => "Basic #{Base64.b64encode("default:default")}"
  }

  resp, data = http.post(path, data, headers)

  # Output on the screen -> we should get either a 302 redirect (after a successful post) or an error page
  puts 'Code = ' + resp.code
  puts 'Message = ' + resp.message
  resp.each {|key, val| puts key + ' = ' + val}
  puts data
end

# {"authInfo": [
#   {
#     "service": "twitter",
#     "credentials": [{
#       "method": "oauth",
#       "key": "9583182-gq9004z74qQThHKCAsaZ9BiNo8mf7Vht1lx8eXiIUo",
#       "secret": "cgv2XDMH4FJeSxwo6HtfAZf33a6eOqdJoBxnYB2D8"
#     }]
#   },
#   {
#     "service": "tumblr",
#     "credentials": [{
#       "method": "userpass",
#       "key": "test@mashbot.net",
#       "secret": "m45hb07"
#     }]
#   }
# ]}
def buildAuthInfoEntry service, method, key, secret
  value,entry = {},{}
  value["key"] = key
  value["secret"] = secret
  value["method"] = method
  entry["service"] = service
  entry["credentials"] = [value]
  return entry
end

def buildAuthInfo entries
  authinfo = {}
  authinfo["authinfo"] = entries
  return authinfo.to_json
end

#{"mObject":{
#  "context":{
#    "entry" :{
#      "key":"status",
#      "value":"mytext"
#}}}}

#{"mObject":{
#  "context":{
#    "entry" :{
#      "key":"photo",
#      "value": photo.image.url
#}}}}

#{"mObject":{
#  "context":{
#    "entry" :{
#      "key":"post",
#      "value": post.body
#}}}}
def buildStatusMObject status
  entry,context,mObject,root = {},{},{},{}
  entry["key"] = "status"
  entry["value"] = [status]
  context["entry"] = entry
  mObject["context"] = context
  root["mObject"] = mObject
  return root.to_json
end