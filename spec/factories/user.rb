Factory.sequence :login do |u|
  "user#{u}"
end

Factory.sequence :email do |u|
  "user#{u}@example.com"
end

Factory.sequence :uid do |u|
  u.to_s
end

Factory.define :user do |u|
  u.id { Factory.next(:uid) }
  u.login { Factory.next(:login) }
  u.email { Factory.next(:email) }
  u.company "The Blue Pojo"
end

