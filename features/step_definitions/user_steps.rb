Given /^there is a user named "(.+)" with the email "(.+)", with the password "(.+)"$/ do |user, email, password|
  @user = User.new({:email => email, :login => user, :password => password, :password_confirmation => password})
  @user.save
end

Given /^there is no user using the email address "(.+)"$/ do |email|
  if User.find(:first, :conditions => [ "email = ?", email ])
    raise "Email address already in use"
  else
    true
  end
end
Then /^there should be a user with the email "(.+)" and the username "(.+)"$/ do |email, username|
  if User.find(:first, :conditions => [ "email = ? AND login = ?", email, username ])
    true
  else
    raise "There is no user with the both the email #{email} and username #{username}."
  end
end
