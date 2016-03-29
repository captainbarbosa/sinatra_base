require 'rubygems'
require 'bundler/setup'
require 'sinatra' # Will start web server
require 'active_record'
require 'pry'

# Set up production DB
# require './production_db'

get '/' do
  "Hello!"
end
