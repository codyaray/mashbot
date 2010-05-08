require 'net/http'

task :cron => :environment do
  # check database for things with time to go_live <= Time.now
  statuses = Status.find(:all, :conditions => ['go_live <= ?', Time.now], :order => 'go_live DESC')

  # send authentication info for all necessary accounts

  users = {}
  for status in statuses
    user = User.find_by_id(status.creator_id)
    users = users.merge({user => []}) if not users.include?(user)
    users[user] << status
  end

  # group auth by user
  for user in users.keys
    authinfo = buildAuthInfo(user.twitter.client.client.access_token.token,user.twitter.client.client.access_token.secret)
    uuid = pushAuthInfo(authinfo)

    print status

    # loop over all things scheduled for now, send each item to the PAAP, and mark as sent
    for status in users[user]
      mobject = buildStatusMObject(status.message)
      pushMObject('status',mobject,uuid)
      # status.mark_as_sent
    end
  end
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

#{"authinfo":{
#  "credentials":{
#    "entry" :{
#      "key":"twitter",
#      "value":{
#         "key":"username",
#         "secret":"yomama"
# }}}}}}}
def buildAuthInfo token, secret
  entry,context,value,credentials,authinfo,root = {},{},{},{},{},{}
  value["key"] = token
  value["secret"] = secret
  value["method"] = "oauth"
  entry = {}
  entry["key"] = "twitter"
  entry["value"] = [value]
  credentials["entry"] = entry
  authinfo["credentials"] = credentials
  root["authinfo"] = authinfo
  return root.to_json
end

#querystring?token=UUID
#{"mObject":{
#  "context":{
#    "entry" :{
#      "key":"status",
#      "value":"mytext"
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