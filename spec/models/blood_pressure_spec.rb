require 'spec_helper'

describe BloodPressure do
	
	describe 'check_min' do
	
		it 'should return true if the value is an Integer' do
			blood_pressure = BloodPressure.new
			blood_pressure.min = 11
			blood_pressure.check_min.should be true
		end

		it 'should return false if the value is not Integer' do
			blood_pressure = BloodPressure.new
			blood_pressure.min ='asd'
			blood_pressure.check_min.should be false
		end

		it 'should return false if the value is not Empty' do
			blood_pressure = BloodPressure.new
			blood_pressure.check_min.should be false
		end
        end
	
	describe 'check_max' do
		it 'should return true if the value is an Integer' do
			blood_pressure = BloodPressure.new
			blood_pressure.max = 11
			blood_pressure.check_max.should be true
		end

		it 'should return false if the value is not Integer' do
			blood_pressure = BloodPressure.new
			blood_pressure.max ='asd'
			blood_pressure.check_max.should be false
		end

		it 'should return false if the value is not Empty' do
			blood_pressure = BloodPressure.new
			blood_pressure.check_max.should be false
		end
 
                
         end
end
