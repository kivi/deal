
Given /^I go to the deal page$/ do
 visit(deal_path(1))
end

Then /^I should see "([^"]*)"$/ do |arg1|
 pending # express the regexp above with the code you wish you had
end

Then /^I press "([^"]*)"$/ do |arg1|
 pending # express the regexp above with the code you wish you had
end


Given /^I wait for (\d+) second$/ do |n|
  sleep n.to_i
end