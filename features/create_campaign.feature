Feature: Create Campaign
  In order to create a campaign
  As a user
  I want to create campaigns that will be able to hold content for publishing.
  
Scenario: Creating a campaign
  When I go to the create campaign page
  And I fill in "Amazing Campaign" for "Title"
  And I fill in "01/15/2100" for "Start date"
  And I fill in "02/14/2100" for "End date"  
  And I press "Create!"
  Then I should see "Amazing Campaign"
  And show me the page
  And I should see "01/15/2100"
  And I should see "02/14/2100"

@wip
Scenario: Validate sane start and end dates
  When I go to the create campaign page
  And I fill in "Fail Campaign" for "Title"
  And I fill in "01/15/2100" for "Start date"
  And I fill in "01/14/2100" for "End date"
  And I press "Create!"
  Then I should see "Hold up! You can't end something before you start it!"
  And show me the page