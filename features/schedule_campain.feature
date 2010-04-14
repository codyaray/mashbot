Feature: Schedule Campaign
  In order to schedule campaigns
  As a user
  I want to schedule and manage the start and end time of campaigns.

Scenario: Unscheduled Campaign List
  Given pojo is logged in
  And I have campaigns titled Twitterblast, Social Network Blitz
  When I go to the schedule page
  And show me the page
  Then I should see "Twitterblast"
  And I should see "Social Network Blitz"
