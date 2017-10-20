ENV['RACK_ENV'] = 'test'
require 'pry'
require 'minitest/autorun'
require 'rack/test'

require File.join(ENV['APP_HOME'], 'features.rb')
