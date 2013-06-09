When(/^I press the seeHistoryButton$/) do
  visit "/blood_pressure_records"
end

Then(/^I should see the image "(.*?)"$/) do |image|
	page.should have_xpath("//img[contains(@src, \"#{image}\")]")
end

 

