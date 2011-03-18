require 'rubygems'
require 'sinatra'
require 'geocoder'

get '/' do
  erb :home
end

get '/locations/search' do
  @result = Geocoder.search(params[:query])
  erb :_location, :layout => false
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

  def to_json(hash)
    hash.collect{ |p| p.map{ |i| i.inspect }.join(":") }.sort.join(",")
  end
end
