Given(/^I have not any pressure records$/) do
  BloodPressure.destroy
end

When(/^I add a blood pressure record with id "(.*?)" and name "(.*?)"$/) do |id_p, name_p|
  record = BloodPressure.new()
  record.id = id_p
  record.name = name_p
  record.date = DateTime.now
  record.min = 10
  record.max = 15
  record.save
end


Then /^(?:|I )should not see "([^\"]*)"(?: within "([^\"]*)")?$/ do |text, selector|
  with_scope(selector) do
    if page.respond_to? :should
      page.should have_no_content(text)
    else
      assert page.has_no_content?(text)
    end
  end
end