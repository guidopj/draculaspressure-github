Given(/^i am at "(.*?)" page$/) do |page_name|
   visit path_to(page_name)
end

Given(/^i have a max of "(.*?)"$/) do |arg1|
  
end

Given(/^i have a min of "(.*?)"$/) do |arg1|

end

Then(/^i should see "(.*?)" in the max field of the table$/) do |arg1|
  
end

Then(/^i should see "(.*?)" in the min field of the table$/) do |arg1|

end

Then(/^i should see "(.*?)"$/) do |arg1|

end

When(/^i am on the "(.*?)"$/) do |arg1|

end

Given(/^i do not have any pressure records$/) do

end

Then(/^i should not see any blood pressures record$/) do

end

Given(/^i have (\d+) pressure records$/) do |arg1|
  page.should have_css("table#recordTable tr", :count=>20)
  #page.all('table#recordTable tr').count.should == 10
  #all("table#recordTable tr").count
end

Then(/^i should see (\d+) blood pressures records$/) do |arg1|

end

Given(/^my first record has id "(.*?)"$/) do |arg1|

end

When(/^i add one more$/) do

end

When(/^when i am on the "(.*?)"$/) do |arg1|

end

Then(/^i should not see id "(.*?)"$/) do |arg1|

end

Then(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|

end

When(/^I press "(.*?)"$/) do |arg1|

end

Then(/^I should see "(.*?)"$/) do |arg1|

end


