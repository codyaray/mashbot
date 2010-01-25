Given /^I have campaigns titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Campaign.create!(:title => title)
  end
end
