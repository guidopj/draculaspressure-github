require 'spec_helper'

  describe PressureAverage do
      describe 'minPressureAverage' do          
        it 'should return 8 when the min average between all the pressure records is 8' do
             bp = double("bloodPressure")
             bp.stub(:min => 8)
             bp.stub!(:minPressureAverage).and_return(8)
        end
        
        it 'should return 0 when there are no min added' do
             bp = double("bloodPressure")
             bp.stub!(:minPressureAverage).and_return(0)
        end
      end
      describe 'maxPressureAverage' do          
        it 'should return 12 when the max average between all the pressure records is 12' do
             bp = double("bloodPressure")
             bp.stub(:max => 12)
             bp.stub!(:maxPressureAverage).and_return(12)
        end
        
        it 'should return 0 when there are no max added' do
             bp = double("bloodPressure")
             bp.stub!(:maxPressureAverage).and_return(0)
        end
      end
  end
