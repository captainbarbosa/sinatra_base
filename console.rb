require 'rubygems'
require 'bundler/setup'
require 'active_record'
require 'pry'
require './production_db.rb'
# migrations

require './employee'
require './department'
require './migrations'
