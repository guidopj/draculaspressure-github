require 'csv'
Draculaspressureapp::App.controllers :blood_pressures do

	get '/index' do
		@title = "Tomas de Presion"
		render '/blood_pressures/index'
	end

  get :new do
    @title = 'New Record'
    @blood_pressure = BloodPressure.new
    render 'blood_pressures/new'
  end

	post :create do
		@min_value_message = ""
		@min_value_message = ""
		params[:blood_pressure]["date"] = DateTime.now.to_s
		params[:blood_pressure]["name"] = current_account.friendly_name
    @blood_pressure = BloodPressure.new(params[:blood_pressure])
	  if @blood_pressure.save
	    redirect(url(:blood_pressures, :show, :id => @blood_pressure.id))
	  else
			if not @blood_pressure.check_min
				@min_value_message = "The Min Value is not valid"
			end
			if not @blood_pressure.check_max 
			  @max_value_message = "The Max Value is not valid"
			end
	    render 'blood_pressures/new'

	  end
  end

	get :exportForm do
		render '/blood_pressures/exportFile'
	end

	post :export do	
		content_type 'aplication/ods ; charset=iso-8859-1; header=present'
		attachment params[:file_name]+".ods"
		BloodPressure.exportBloodPressures(current_account.friendly_name)
  end
 
  get :show do
    @blood_pressure = BloodPressure.get(params[:id].to_i)
    render 'blood_pressures/show'
  end

   get '/blood_pressure_records' do
     @rec = BloodPressure.all(:name => current_account.friendly_name, :order => [:id.desc], :limit => 10)
     render 'blood_pressures/blood_pressure_records'
  end

  get '/averageForm' do
     render 'blood_pressures/averageForm'
  end

  post :calculateAverage do  
		if BloodPressure.check_date(params[:minDate])	&& 	BloodPressure.check_date(params[:maxDate])	
			begin	
				@avrMin = BloodPressure.minPressureAverage(params[:minDate],params[:maxDate],current_account.friendly_name)
				@avrMax = BloodPressure.maxPressureAverage(params[:minDate],params[:maxDate],current_account.friendly_name)
				@errorMessageAverage= ""
				render 'blood_pressures/average'				
			rescue WithoutElementsException::ThereIsNoRecordsInTheSpecifiedRangeOfDates
				@errorMessageAverage= "No such records in the specified range of dates"
				render 'blood_pressures/averageForm'
			end
		else
			@errorMessageAverage= "Invalid dates, please follow the convention: yyyy-mm-dd"
			render 'blood_pressures/averageForm'
		end
  end
end
