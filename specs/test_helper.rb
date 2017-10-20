ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'bundler'
Bundler.require(:test)

require File.join(ENV['APP_HOME'], 'features.rb')
