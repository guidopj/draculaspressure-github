require 'date/format'
require 'time'

class BloodPressure
  include DataMapper::Resource

  property :id, Serial
  property :max, Integer
  property :min, Integer
  property :date, Date, :required => true
  property :name, String

	validates_with_method :check_min
	validates_with_method :check_max
	
	def self.check_date(date)  
		begin	
			Date.parse(date)
		rescue Exception
			return false
		end
		return date.length == 10 
  end

  def check_min  
    return self.min.is_a?(Integer)
  end
	
  def check_max
    return self.max.is_a?(Integer)
  end

  def get_state_image
    if min.between?(7,9) and max.between?(11,13)
      return "http://programacionyjuegos.files.wordpress.com/2012/02/cuadrado_verde.png"
    else
      return "http://www.cientec.or.cr/matematica/origami/rojo.gif" 
    end
  end
  
  def self.minPressureAverage(minDate, maxDate, name)
     avr = 0
     @record = BloodPressure.all(:name => name, :date => (minDate..maxDate))
      if @record.count != 0
        @record.each do |r|
           avr = avr + r.min
         end
      else
         raise WithoutElementsException::ThereIsNoRecordsInTheSpecifiedRangeOfDates
      end
     return (avr.to_f / @record.count)
  end

  def self.maxPressureAverage(minDate, maxDate,name)
    avr = 0
    @record = BloodPressure.all(:name => name,:date => (minDate..maxDate)) 
      if @record.count != 0
        @record.each do |r|
          avr = avr + r.max
        end
      else
        raise WithoutElementsException::ThereIsNoRecordsInTheSpecifiedRangeOfDates
      end 
    return (avr.to_f / @record.count) 
  end
end
