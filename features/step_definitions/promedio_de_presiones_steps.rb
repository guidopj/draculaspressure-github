Given(/^I have a blood pressure record with min (\d+) and max (\d+) and date "(.*?)"$/) do |min, max, date|
  bp1 = BloodPressure.new
  bp1.min = min
  bp1.max = max
  bp1.date = date
  bp2 = BloodPressure.new
  bp2.min = min
  bp2.max = max
  bp2.date = date
end


