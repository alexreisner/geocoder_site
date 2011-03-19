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
      "51.178844, -1.826189", # Stonehenge
      "29.979175, 31.134358", # Great Pyramid of Giza
      "Tiananmen Square, Beijing",
      "-34.609653, -58.392581", # Argentine National Congress
    ]
  end
end
