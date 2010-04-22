Feature: Add content to a campaign
  In order to have campaigns actually do something
  As a user
  I want to create content that can be scheduled for publishing

@wip
Scenario: Creating a status update
  Given pojo is logged in
  And there is a standard campaign
  And I am on the last created "Campaign" page
  When I follow "Create content"
  And I follow "Create new status"  
  And show me the page
  And I fill in "This is my awesome status for the twitterverse" for "status_message"
  And I press "Submit"
  Then there should be a "Status" with the following:
    | campaign_id | last                                           |
    | message     | This is my awesome status for the twitterverse |
    | go_live     | thisisthedatetime                              |
    | creator_id  | lastuser                                       |

