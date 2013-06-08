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

	def get_state_image
		if min.between?(7,9) and max.between?(11,13)
			return "http://programacionyjuegos.files.wordpress.com/2012/02/cuadrado_verde.png"
		else
			return "http://www.cientec.or.cr/matematica/origami/rojo.gif" 
  	end
	end
end
