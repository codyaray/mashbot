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

    # if user.blogger
    #   token = user.blogger.client.client.access_token.token
    #   secret = user.blogger.client.client.access_token.secret
    #   bloggerEntry = buildAuthInfoEntry(:blogger, :oauth, token, secret)
    # end

    if user.tumblr
      email = user.tumblr.login
      password = user.tumblr.password
      tumblrEntry = buildAuthInfoEntry(:tumblr, :userpass, email, password)
    end
    
    if user.flickr
      username = user.login
      token = user.flickr.details[:token]
      flickrEntry = buildAuthInfoEntry(:flickr, :proprietary, username, token)
    end
    
    entries = [twitterEntry, tumblrEntry, flickrEntry].compact
    if entries.length > 0
      authinfo = buildAuthInfo entries
      uuid = pushAuthInfo(authinfo)
      # print authinfo
    end

    # loop over all things scheduled for now, send each item to the PAAP, and mark as sent
    for item in users[user]
      if item.is_a? Status
        type = 'status'
        mobject = buildStatusMObject(item.message)
      elsif item.is_a? Post
        type = 'post'
        mobject = buildPostMObject(item.title, item.body, item.tags)
      elsif item.is_a? Photo
        type = 'photo'
        mobject = buildPhotoMObject('http://144.118.156.2:3000' + item.image.url, item.title, item.caption, item.tags)
      end

      pushMObject(type,mobject,uuid)
      item.sent = true
      # item.save!
    end
  end
end

def pushAuthInfo authinfo
  http = Net::HTTP.new('144.118.146.124', 8080)
  path = '/mashbot/rest/auth'

  # POST request -> push status
  data = authinfo
  headers = {
    'Content-Type' => 'application/json',
    'Authorization' => "Basic #{Base64.b64encode("default:default")}"
  }
  puts data

  # receive UUID as (json) string

  resp, data = http.post(path, data, headers)
  
  return data # UUID token
end

def pushMObject type, mobject, uuid
  http = Net::HTTP.new('144.118.146.124', 8080)
  path = '/mashbot/rest/' + type + '?token=' + uuid

  # POST request -> push mobject
  data = mobject
  headers = {
    'Content-Type' => 'application/json',
    'Authorization' => "Basic #{Base64.b64encode("default:default")}"
  }
  puts data

  resp, data = http.post(path, data, headers)

  # Output on the screen -> we should get either a 302 redirect (after a successful post) or an error page
  puts 'Code = ' + resp.code
  puts 'Message = ' + resp.message
  resp.each {|key, val| puts key + ' = ' + val}
  puts data
end

# {"userauth":
#   {"credentials": [{
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
#       "key": "test@mashbot.net",
#       "secret": "m45hb07",
#       "method": "userpass" 
#     }]
#   }]
# }}
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
  userauth,credentials = {},{}
  credentials["credentials"] = entries
  userauth["userauth"] = credentials
  return userauth.to_json
end

#{"mObject":{
#  "context":{
#    "entry" :{
#      "key":"status",
#      "value":"mytext"
#}}}}
def buildStatusMObject status
  entry,context,mObject,root = {},{},{},{}
  entry["key"] = "status"
  entry["value"] = status
  mObject["context"] = [entry]
  root["mObject"] = mObject
  return root.to_json
end

#{"mObject":{
#  "context":{
#    "entry":{
#      "key":"postTitle",
#      "value": post.title
#    } "entry":{
#      "key":"body",
#      "value": post.body
#    } "entry": {
#      "key": "tags"
#      "value": post.tags
#    }
#}}}}
def buildPostMObject title, body, tags=nil
  entry1,entry2,context,mObject,root = {},{},{},{},{},{}
  entry1["key"] = "postTitle"
  entry1["value"] = title
  entry2["key"] = "body"
  entry2["value"] = body
  if tags
    entry3 = {}
    entry3["key"] = "tags"
    entry3["value"] = tags
  end
  mObject["context"] = [entry1, entry2, entry3].compact
  root["mObject"] = mObject
  root.to_json
end

#{"mObject":{
#  "context":{
#      "key":"photo",
#      "value": photo.image.url
#}}}
def buildPhotoMObject url, title, caption=nil, tags=nil, album=nil
  entry1, entry2, context, mObject, root = {},{},{},{},{}
  entry1["key"] = "url"
  entry1["value"] = url
  entry2["key"] = "title"
  entry2["value"] = title
  if caption
    entry3 = {}
    entry3["key"] = "caption"
    entry3["value"] = caption
  end
  if tags
    entry4 = {}
    entry4["key"] = "tags"
    entry4["value"] = tags.split( /, */ )
  end
  if album
    entry5 = {}
    entry5["key"] = "album"
    entry5["value"] = album
  end
  mObject["context"] = [entry1, entry2, entry3, entry4, entry5].compact
  root["mObject"] = mObject
  root.to_json
end