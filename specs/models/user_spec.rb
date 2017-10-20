require File.join(ENV['APP_HOME'], 'specs/test_helper.rb')
require 'pry'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe 'Users API' do
  describe 'GET /users' do
    describe 'When there are no users' do
      it 'should return a list of 0 users' do
        response = get '/api/v1/users'
        response.body.must_be :==, '[]'
      end
    end
  end
end
