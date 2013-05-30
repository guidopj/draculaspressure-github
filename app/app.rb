module Draculaspressureapp
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers
    register Padrino::Admin::AccessControl

    enable :sessions

		configure :development, :travis do
      use OmniAuth::Builder do
        provider :developer
      end
      set :login_page, "/login"    
    end
    
    #provider :twitter,  'consumer_key', 'consumer_secret'
    
    access_control.roles_for :any do |role|
        role.protect "/blood_pressures"
    end

    get '/' do
      render 'home/index'
    end

    get "/login" do
      render '/home/login'
    end

    post :auth, :map => '/auth/:provider/callback' do
        auth    = request.env["omniauth.auth"]
        account = Account.find_by_provider_and_uid(auth["provider"], auth["uid"]) || 
                Account.create_with_omniauth(auth)
        set_current_account(account)
        redirect "/blood_pressures/new"
    end
  end
end
