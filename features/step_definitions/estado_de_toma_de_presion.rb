Then(/^I should see the image "(.*?)"$/) do |image|
	page.should have_xpath("//img[contains(@src, \"#{image}\")]")
end



