class PressureRecords
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :date, Date
  property :hour, Hour
  property :min, Integer
  property :max, Integer

  def self.create_with_omniauth(auth)
    account = Account.new
    account.provider = auth["provider"]
    account.uid      = auth["uid"]
    account.name     = auth["user_info"]["name"] if auth["user_info"] # we get this only from FB
    account.email    = auth["user_info"]["email"] if auth["user_info"] # we get this only from FB
    account.save
    account
  end
end 
