Feature: Create Campaign
  In order to create a campaign
  As a user
  I want to create campaigns that will be able to hold content for publishing.
  
@wip
Scenario: Creating a campaign
  When I go to the create campaign page
  And show me the page
  And I fill in "Twitteriffic Campaign" for "campaign_title"
  And I press "Create!"
  Then I should see "Title: Twitteriffic Campaign"