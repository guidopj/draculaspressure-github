require 'date/format'
require 'time'
require 'csv'

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
    return min.is_a?(Integer)
  end
	
  def check_max
    return max.is_a?(Integer)
  end

  def get_state_image
    if min.between?(7,9) and max.between?(11,13)
      return "http://programacionyjuegos.files.wordpress.com/2012/02/cuadrado_verde.png"
    else
      return "http://www.cientec.or.cr/matematica/origami/rojo.gif" 
    end
  end

  def self.minPressureAverage(minDate, maxDate, name)
		funcion = Proc.new {|blood_pressure_record| blood_pressure_record.min}		
		self.pressureAverage(minDate, maxDate, name, funcion)
  end

  def self.maxPressureAverage(minDate, maxDate,name)
		funcion = Proc.new {|blood_pressure_record| blood_pressure_record.max}		
		self.pressureAverage(minDate, maxDate, name, funcion)
  end

	private
	def self.pressureAverage(minDate, maxDate, name, funcion)
	   avr = 0
     @record = BloodPressure.all(:name => name, :date => (minDate..maxDate))
      if @record.count != 0
        @record.each do |blood_pressure_record|
           avr = avr + funcion.call(blood_pressure_record)
         end
      else
         raise WithoutElementsException::ThereIsNoRecordsInTheSpecifiedRangeOfDates
      end
     return (avr.to_f / @record.count)
  end

	def self.exportBloodPressures(name)		
		@record = BloodPressure.all(:name => name)		

		hoja_de_calculo = CSV.generate do |csv|
			csv	<< ["Owner max min date"]
			csv	<< [" "]
				@record.each do |bp|
					csv << [bp.name+" "+bp.max.to_s+" "+bp.min.to_s+" "+bp.date.to_date.to_s]
				end				
			end
		return hoja_de_calculo
  end
end
