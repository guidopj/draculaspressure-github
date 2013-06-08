Then(/^I should see the image "(.*?)"$/) do |image|
  if page.respond_to? :should
		page.should have_selector("img[src$='#{image}']")
	else
		assert page.has_selector?("img[src='#{image}']")
	end
end

