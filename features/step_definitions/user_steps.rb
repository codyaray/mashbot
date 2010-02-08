
Given /^there is a user named "(.+)" with the email "(.+)", with the password "(.+)" from the company "(.+)"$/ do |user, email, password, company|
  @user = User.new({:email => email, :login => user, :password => password, :password_confirmation => password, :company => company})
  @user.save
end

Given /^there is no user using the email address "(.+)"$/ do |email|
  if User.find(:first, :conditions => [ "email = ?", email ])
    raise "Email address already in use"
  else
    true
  end
end

Then /^there should be a user with the email "(.+)" and the username "(.+)" from the company "(.+)"$/ do |email, username, company|
  if User.find(:first, :conditions => [ "email = ? AND login = ? AND company = ?", email, username, company ])
    true
  else
    raise "There is no user with the both the email #{email} and username #{username} from the company #{company}."
  end
end

Given /^pojo is logged in$/ do
  Given "I am on the home page"
  And "there is a user named \"pojo\" with the email \"example@pojo.com\", with the password \"bumble_bee1\" from the company \"Bloo Corp\""
  When "I follow \"Login\" within \"#administrative-links\""
  And "I fill in \"pojo\" for \"Login\""
  And "I fill in \"bumble_bee1\" for \"Password\""
  And "I press \"Login\""
end
