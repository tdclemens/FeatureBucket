# frozen_string_literal: true

require 'bundler'
require 'sinatra/swagger'
Bundler.require(:default)
require_relative 'models/user'

set :bind, '172.16.0.8'
set :port, '3000'

Mongoid.load! 'mongoid.yml'

# Validate and initialize swagger config
register Sinatra::Swagger::ParamValidator
swagger('swagger/users.yml')

register Sinatra::Logger

# Write the swagger json to a shared volume
File.open('/swagger/swagger_spec.json', 'w+') do |f|
  f.write(settings.swagger.spec.to_json)
end

set :allow_origin, 'http://localhost'
set :allow_methods, [:get, :post, :put, :options]

configure do
  enable :cross_origin
end

before do
  logger.info("payload='#{params[:body]}'")
end

# For cross origin requests sometimes an option call is made
options '*' do
  response.headers['Allow'] = 'HEAD,GET,PUT,POST,DELETE,OPTIONS'
  response.headers['Access-Control-Allow-Headers'] = ['X-Requested-With',
                                                      'X-HTTP-Method-Override',
                                                      'Content-Type',
                                                      'Cache-Control',
                                                      'Accept'].join(', ')
  200
end

get '/' do
  redirect 'http://localhost'
end

get '/api/v1/users' do
  User.all.to_json(except: :password)
end

put '/api/v1/users' do
  begin
    payload = params[:body]
    User.create!(email: payload['email'],
                 password: payload['password'],
                 first_name: payload['first_name'] || '',
                 last_name: payload['last_name'] || '').to_json(except: :password)
  rescue Mongoid::Errors::Validations => e
    status 400
    body({ message: e.message }.to_json)
  end
end
