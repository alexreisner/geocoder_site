require 'rubygems'
require 'sinatra'
require 'geocoder'

get '/' do
  erb :home
end

get '/locations/search' do
  if coordinates?(params[:query])
    coords = params[:query].split(/\s*,\s*/).map{ |i| i.to_f }
    @result = Geocoder.search(*coords).first
  else
    @result = Geocoder.search(params[:query]).first
  end
  erb :_location, :layout => false
end

not_found do
  '404 Not Found'
end

error do
  '500 Internal Server Error'
end

def coordinates?(string)
  l = Geocoder.send(:lookup)
  l.send(:coordinates?, string)
end

helpers do
  include Rack::Utils
  alias_method :h, :escape_html

  def separator
    '<div class="separator"></div>'
  end

  def to_json(hash)
    hash.collect{ |p| p.map{ |i| i.inspect }.join(":") }.sort.join(",")
  end

  def return_value_cell
    "<td><code>#&nbsp;=></code></td>"
  end

  def random_search_query
    sample_search_queries[rand(sample_search_queries.size)]
  end

  def sample_search_queries
    [
      "Paris, France",
      "Paris, Texas",
      "405 Lexington Avenue, NY",
      "1 Twins Way, Minneapolis",
      "Taj Mahal, Agra, India",
      "Acropolis, Theorias, Athens",
      "Tiananmen Square, Beijing",
      "51.178844,-1.826189", # Stonehenge
      "29.979175,31.134358", # Great Pyramid of Giza
      "-34.609653,-58.392581", # Argentine National Congress
    ]
  end
end
