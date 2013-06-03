require 'rspec'

describe BloodPressure do

  describe 'guess' do

    it 'should return the max value of someone' do
      bp = BloodPressure.new()
      bp.max = 10
      bp.min = 7
      code_breaker.getLife.should eq 10
    end
