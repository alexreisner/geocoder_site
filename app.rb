require 'rubygems'
require 'sinatra'

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
  include Rack::Utils
  alias_method :h, :escape_html

  def separator
    '<div class="separator"></div>'
  end
end
