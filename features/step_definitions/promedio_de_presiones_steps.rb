Given(/^I have a blood pressure record with min "(.*?)" and max "(.*?)" and date "(.*?)"$/) do |min,max,date|
  bp = BloodPressure.new
  bp.min = min
  bp.max = max
  bp.date = date
  bp.save
end

