Factory.sequence :campaign_title do |u|
  "The super ##{u} campaign"
end

Factory.define :campaign do |c|
  c.title { Factory.next(:campaign_title) }
  c.start_date '3:15am 05/05/2050'
  c.end_date '5:51pm 05/06/2050'
end
