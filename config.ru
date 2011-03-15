require 'bundler'
Bundler.require

require './app'

environment = ENV['RACK_ENV'].intern
root_dir    = File.dirname(__FILE__)
log_file    = File.join(root_dir, "log", "sinatra.log")

set :environment, environment
set :root,        root_dir
set :app_file,    File.join(root_dir, 'app.rb')
disable :run

log = File.new(log_file, "a")
$stdout.reopen(log)
$stderr.reopen(log)

run Sinatra::Application

