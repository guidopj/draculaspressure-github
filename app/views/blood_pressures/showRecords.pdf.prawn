require "prawn";
require 'sinatra/prawn'

 @pdf = Prawn::Document.new
    @pdf.text "dsa"
    @pdf.render_file "archivo.pdf"
