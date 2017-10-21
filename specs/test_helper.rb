# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'
Bundler.require(:default, :test)
$LOAD_PATH.unshift ENV['APP_HOME']

require 'minitest/autorun'
require 'bundler'
require 'features'

# extend Minitest to use factory_bot
module Minitest
  # spec module that lives in Minitest
  class Spec
    include FactoryBot::Syntax::Methods
  end
end

FactoryBot.definition_file_paths << File.join(ENV['APP_HOME'],
                                              'specs',
                                              'factories')
FactoryBot.find_definitions
