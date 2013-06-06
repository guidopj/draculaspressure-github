class PressureAverage
  include DataMapper::Resource

  # property <name>, <type>
    property :id, Serial
  property :minDate, DateTime, :required => true
  property :maxDate, DateTime,  :required => true

   def minPressureAverage(record)
     avr = 0
     #@record = BloodPressure.all(:date => minDate..maxDate)
     record.each do |r|
       avr = avr + r.min
     end
     return (avr.to_f / record.count)
  end

  def maxPressureAverage(record)
     avr = 0
    #@record = BloodPressure.all(:date => minDate..maxDate)  
     record.each do |r|
       avr = avr + r.max
     end
     return (avr.to_f / record.count)
  end
end
