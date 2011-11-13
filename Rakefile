namespace :cache do

  desc "Load the app environment."
  task :environment do
    require './app.rb'
  end

  desc "Clear the cache."
  task :expire => :environment do
    Geocoder.cache.expire(:all)
  end
end
