class BloodPressure
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :max, Integer
  property :min, Integer
  property :date, DateTime, :required => true
  property :duenio, String

	validates_with_method :check_min
	validates_with_method :check_max
	
  def check_min  
    return self.min.is_a?(Integer)
  end
	
  def check_max
    return self.max.is_a?(Integer)
  end
  
end
