require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given(/^i am at "(.*?)" page$/) do |arg1|
  visit ""
end

Given(/^i have a max of "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^i have a min of "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^i should see "(.*?)" in the max field of the table$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^i should see "(.*?)" in the min field of the table$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^i should see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^i am on the "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^i do not have any pressure records$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^i should not see any blood pressures record$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^i have (\d+) pressure records$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^i should see (\d+) blood pressures records$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^my first record has id "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^i add one more$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^when i am on the "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^i should not see id "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

