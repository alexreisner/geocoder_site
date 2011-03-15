require 'rubygems'
require 'sinatra'
require 'geocoder'

get '/' do
  erb :home
end

not_found do
  '404 Not Found'
end

error do
  '500 Internal Server Error'
end

helpers do

  def separator
    '<div class="separator"></div>'
  end
end
