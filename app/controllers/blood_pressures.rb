Draculaspressureapp::App.controllers :blood_pressures do

  get :new do
    @title = 'new record'
    @blood_pressure = BloodPressure.new
    render 'blood_pressures/new'
  end
  get :index do
    @title = "Tomas de Presion"
    @blood_pressure = BloodPressure.all
    render 'blood_pressures/index'
  end


  get :show do
    @blood_pressure = BloodPressure.get(params[:id].to_i)
    render 'blood_pressures/show'
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
				@errorMessageAverage= "No hay tomas de presion entre las fechas indicadas"
				render 'blood_pressures/averageForm'
			end
		else
			@errorMessageAverage= "Fechas invalidas, por favor siga este formato: yyyy-mm-dd"
			render 'blood_pressures/averageForm'
		end
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

  get :edit, :with => :id do
    @title = t(:edit_title, :model => "toma de presion #{params[:id]}")
    @blood_pressure = BloodPressure.get(params[:id].to_i)
    if @blood_pressure
      render 'blood_pressures/edit'
    else
      flash[:warning] = t(:create_error, :model => 'toma de presion ', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = t(:update_title, :model => "toma de presion #{params[:id]}")
    @blood_pressure = BloodPressure.get(params[:id].to_i)
    if @blood_pressure
      if @blood_pressure.update(params[:blood_pressure])
        flash[:success] = t(:update_success, :model => 'Toma de presion', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:blood_pressures, :index)) :
          redirect(url(:blood_pressures, :edit, :id => @blood_pressure.id))
      else
        flash.now[:error] = t(:update_error, :model => 'toma de presion')
        render 'blood_pressures/edit'
      end
    else
      flash[:warning] = t(:update_warning, :model => 'toma de presion', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Tomas de presion"
    blood_pressure = BloodPressure.get(params[:id].to_i)
    if blood_pressure
      if blood_pressure.destroy
        flash[:success] = t(:delete_success, :model => 'Toma de presion', :id => "#{params[:id]}")
      else
        flash[:error] = t(:delete_error, :model => 'toma de presion')
      end
      redirect url(:blood_pressure, :index)
    else
      flash[:warning] = t(:delete_warning, :model => 'toma de presion', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Tomas de presion"
    unless params[:blood_pressure_ids]
      flash[:error] = t(:destroy_many_error, :model => 'toma de presion')
      redirect(url(:blood_pressures, :index))
    end
    ids = params[:blood_pressure_ids].split(',').map(&:strip).map(&:to_i)
    blood_pressures = BloodPressure.all(:id => ids)
    
    if blood_pressure.destroy
    
      flash[:success] = t(:destroy_many_success, :model => 'Tomas de presion', :ids => "#{ids.to_sentence}")
    end
    redirect url(:blood_pressures, :index)
  end
end
