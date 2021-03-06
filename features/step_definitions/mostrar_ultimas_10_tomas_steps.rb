require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given(/^i do not have any pressure records$/) do
 BloodPressure.destroy
end

When(/^i am on the "(.*?)"$/) do |arg1|
  visit "/blood_pressure_records"
end


Then(/^i should not see any blood pressures record$/) do
  page.should have_css("table#recordTable tr", :count=>0)
end

Given(/^i have (\d+) pressure records$/) do |arg1|
 BloodPressure.destroy
 t1 = BloodPressure.new
 t1.max = 12
 t1.min = 8
 t1.date = "2013-01-01"
 t1.name = "Guido"
 t1.save
 t2 = BloodPressure.new
 t2.max = 12
 t2.min = 8
 t2.date = "2013-01-01"
 t2.name = "Guido"
 t2.save
 t3 = BloodPressure.new
 t3.max = 12
 t3.min = 8
 t3.date = "2013-01-01"
 t3.name = "Guido"
 t3.save
 t4 = BloodPressure.new
 t4.max = 12
 t4.min = 8
 t4.date = "2013-01-01"
 t4.name = "Guido"
 t4.save
 t5 = BloodPressure.new
 t5.max = 12
 t5.min = 8
 t5.date = "2013-01-01"
 t5.name = "Guido"
 t5.save
 t6 = BloodPressure.new
 t6.max = 12
 t6.min = 8
 t6.date = "2013-01-01"
 t6.name = "Guido"
 t6.save
 t7 = BloodPressure.new
 t7.max = 12
 t7.min = 8
 t7.date = "2013-01-01"
 t7.name = "Guido"
 t7.save
 t8 = BloodPressure.new
 t8.max = 12
 t8.min = 8
 t8.date = "2013-01-01"
 t8.name = "Guido"
 t8.save
 t9 = BloodPressure.new
 t9.max = 12
 t9.min = 8
 t9.date = "2013-01-01"
 t9.name = "Guido"
 t9.save
 t10 = BloodPressure.new
 t10.max = 12
 t10.min = 8
 t10.date = "2013-01-01"
 t10.name = "Guido"
 t10.save
end

Then(/^i should see (\d+) blood pressures records$/) do |arg1|
 all("table#recordTable tr").count == arg1
end

Given(/^my first record has id 1$/) do
BloodPressure.destroy
 t1 = BloodPressure.new
 t1.max = 12
 t1.min = 8
 t1.date = "2013-01-01"
 t1.name = "Guido"
 t1.save
 t2 = BloodPressure.new
 t2.max = 12
 t2.min = 8
 t2.date = "2013-01-01"
 t2.name = "Guido"
 t2.save
 t3 = BloodPressure.new
 t3.max = 12
 t3.min = 8
 t3.date = "2013-01-01"
 t3.name = "Guido"
 t3.save
 t4 = BloodPressure.new
 t4.max = 12
 t4.min = 8
 t4.date = "2013-01-01"
 t4.name = "Guido"
 t4.save
 t5 = BloodPressure.new
 t5.max = 12
 t5.min = 8
 t5.date = "2013-01-01"
 t5.name = "Guido"
 t5.save
 t6 = BloodPressure.new
 t6.max = 12
 t6.min = 8
 t6.date = "2013-01-01"
 t6.name = "Guido"
 t6.save
 t7 = BloodPressure.new
 t7.max = 12
 t7.min = 8
 t7.date = "2013-01-01"
 t7.name = "Guido"
 t7.save
 t8 = BloodPressure.new
 t8.max = 12
 t8.min = 8
 t8.date = "2013-01-01"
 t8.name = "Guido"
 t8.save
 t9 = BloodPressure.new
 t9.max = 12
 t9.min = 8
 t9.date = "2013-01-01"
 t9.name = "Guido"
 t9.save
 t10 = BloodPressure.new
 t10.max = 12
 t10.min = 8
 t10.date = "2013-01-01"
 t10.name = "Guido"
 t10.save
 
end

When(/^i add one more$/) do
t11 = BloodPressure.new
 t11.max = 12
 t11.min = 8
 t11.date = "2013-01-01"
 t11.name = "Guido"
 t11.save
end

Then(/^i should not see id "(.*?)"$/) do |content|
    if page.respond_to? :should
      page.should have_no_content(content)
    else
      assert page.has_no_content?(content)
    end
end



