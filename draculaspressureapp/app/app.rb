module Draculaspressureapp
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions
    
    get '/' do
      'hola Guido'
    end
  end
end
