class BloodPressure
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :max, Integer
  property :min, Integer
  property :date, DateTime, :required => true
	property :name, String
end
