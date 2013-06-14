Given(/^I have a blood pressure record with min "(.*?)" and max "(.*?)" and date "(.*?)" with name "(.*?)"$/) do |min, max, date, name|
  bp1 = BloodPressure.new
  bp1.min = min
  bp1.max = max
  bp1.date = date
	bp1.name = name
	bp1.save
end

