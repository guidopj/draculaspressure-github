require 'spec_helper'

describe BloodPressure do
	
	describe 'check_date' do
	
    it 'should return true if the date is a Date' do
      BloodPressure.check_date('2013-10-10').should be true
   end

		
    it 'should return false if the date is not a Date' do
      BloodPressure.check_date('2').should be false
   end

		it 'should return false if the date is kind of a Date' do
      BloodPressure.check_date('2013-10-10----2').should be false
   end


	end

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

	describe 'get_state_image' do
		it 'should return a green image if min is between 7 and 9, and max is between 11 and 13' do
			blood_pressure = BloodPressure.new
			blood_pressure.max = 12
			blood_pressure.min = 8
			blood_pressure.get_state_image.should eq("http://programacionyjuegos.files.wordpress.com/2012/02/cuadrado_verde.png")
		end

		it 'should return a red image if min is not between 7 and 9, or max is not between 11 and 13' do
			blood_pressure = BloodPressure.new
			blood_pressure.max = 10
			blood_pressure.min = 6
			blood_pressure.get_state_image.should eq("http://www.cientec.or.cr/matematica/origami/rojo.gif")
		end                
  end
  
  describe 'maxPressureAverage' do
    it 'should return 13 when max are 14 and 12' do
    	bloodpressure1 = BloodPressure.new
    	bloodpressure1.max = 14
    	bloodpressure = BloodPressure.new
    	bloodpressure.max = 12
    	BloodPressure.should_receive(:all).and_return([bloodpressure1,bloodpressure])
    	BloodPressure.maxPressureAverage(bloodpressure1.date,bloodpressure.date).should eq 13
    end
  end
end
