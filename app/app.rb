module Draculaspressureapp
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers
    register Padrino::Admin::AccessControl

    enable :sessions

    configure :travis, :test , :development do
      use OmniAuth::Builder do
        provider :developer
      end
      set :login_page, "/login"   
      ENV['APP_URL'] = 'http://127.0.0.1:3000/' 
    end
    
    configure :staging, :production do
      use OmniAuth::Builder do
        provider :twitter,'SGGn3SkV4hrAy7Em8eyxQ','0rOsaRXCPGaHDIYhxrvEC5ARC1L18XcAaWgn1JcFsm4'
#,ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_SECRET_KEY'] 
      end
      set :login_page, "/auth/twitter"
			

    end
    
    access_control.roles_for :any do |role|
        role.protect "/blood_pressures"
    end

    get '/' do
      render 'home/index'
    end

    get :login do
      render '/home/login'
    end

   get '/blood_pressure_records' do
     @rec = BloodPressure.all(:name => session[:current_account_uid], :order => [:id.desc], :limit => 10)
     render 'blood_pressures/blood_pressure_records'
  end

    get :auth, :map => '/auth/:provider/callback' do
        auth    = request.env["omniauth.auth"]
        account = Account.find_by_provider_and_uid(auth["provider"], auth["uid"]) || 
                Account.create_with_omniauth(auth)
        set_current_account(account)
        redirect "/blood_pressures/new"
    end
  end
end
