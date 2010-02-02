Feature: Not logged in header links
  In order to be able to log in
  As a user
  I want to be able to see the log in link in the header when I am not logged in.


Scenario: Not Logged in Header
  Given I am on the home page
  Then I should see "Login" within "#administrative-links"
  And I should see "Register" within "#administrative-links"
  And I should not see "Logout" within "#administrative-links"

Scenario: Registering a new account
  Given I am on the home page
  And there is no user using the email address "bloo@example.net"
  And I follow "Register"
  And I fill in "Bloo" for "Login"
  And I fill in "bloo@example.net" for "Email"
  And I fill in "bloospassword" for "Password"
  And I fill in "bloospassword" for "Password confirmation"
  Then I press "Register"
  And there should be a user with the email "bloo@example.net" and the username "bloo"

Scenario: Logging In
  Given I am on the home page
  And there is a user named "pojo" with the email "example@pojo.com", with the password "bumble_bee1"
  When I follow "Login" within "#administrative-links"
  And I fill in "pojo" for "Login"
  And I fill in "bumble_bee1" for "Password"
  And I press "Login"
  Then I should see "pojo" within "#administrative-links"
  And I should see "Logout" within "#administrative-links"
  And I should see "My Account" within "#administrative-links"
