require 'spec_helper'

describe BloodPressure do
	
	describe 'check_min' do
	
		it 'should return false if the value is not Integer' do
			blood_pressure = BloodPressure.new
			blood_pressure.min ='asd'
			blood_pressure.max = 13
			blood_pressure.check_min_and_max.should be false
		end
		
		it 'should return true if the value is Integer' do
			blood_pressure = BloodPressure.new
			blood_pressure.min = 10
			blood_pressure.max = 13
			blood_pressure.check_min_and_max.should be true
		end
  end
	
	describe 'check_max' do
	
		it 'should return false if the value is not Integer' do
			blood_pressure = BloodPressure.new
			blood_pressure.min = 10
			blood_pressure.max = "10"
			blood_pressure.check_min_and_max.should be false
		end
		
		it 'should return true if the value is a Integer' do
			blood_pressure = BloodPressure.new
			blood_pressure.min = 10
			blood_pressure.max = 13
			blood_pressure.check_min_and_max.should be true
		end

		it 'should return true if the value is a Integer' do
			blood_pressure = BloodPressure.new
			blood_pressure.min = 10
			blood_pressure.max = 13
			blood_pressure.check_min_and_max.should be true
		end

  end
end
