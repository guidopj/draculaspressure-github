#module WithoutElementsException::ThereIsNoRecordsInTheSpecifiedRangeOfDates
 # ThereIsNoRecordsInTheSpecifiedRangeOfDates = Class.new Exception
#end

class WithOutElementsException < Exception
	def getMessage()
   puts "WithOutElementsException"
   return "WithOutElementsException" 
  end
end
