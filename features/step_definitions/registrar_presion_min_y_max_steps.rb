require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given(/^I am logged in$/) do
  visit "/login"
  fill_in("name", :with => "cucumber_user")
  fill_in("email", :with => "cucumber_user@someplace.com")
  click_button "submit"
end

Given(/^I am logged in with name "(.*?)"$/) do |name|
  visit "/login"
  fill_in("name", :with => name)
  fill_in("email", :with => name)
  click_button "submit"
end


Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, data|
  fill_in(field, :with => data)
end

When(/^I press "(.*?)"$/) do |button|
  click_button(button)
end

Then(/^I should see "(.*?)"$/) do |spected_message|
    if page.respond_to? :should
      page.should have_content(spected_message)
    else
      assert page.has_content?(spected_message)
    end
end


When(/^I visit "(.*?)"$/) do |page|
  visit path_to(page)
end


