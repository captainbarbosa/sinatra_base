ENV['RACK_ENV'] = 'test'

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require 'sqlite3'

require "./app"
require './migrations'
