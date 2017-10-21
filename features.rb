# frozen_string_literal: true

require 'bundler'
require 'sinatra/swagger'
Bundler.require(:default)
require_relative 'models/user'

set :bind, '172.16.0.8'
set :port, '3000'

Mongoid.load! 'mongoid.yml'
Mongoid::EncryptedFields.cipher = BCrypt::Password

# Validate and initialize swagger config
swagger('swagger/users.yml')

# Write the swagger json to a shared volume
File.open('/swagger/swagger_spec.json', 'w+') do |f|
  f.write(settings.swagger.spec.to_json)
end

set :allow_origin, 'http://localhost'

configure do
  enable :cross_origin
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
  User.all.to_json
end

put '/api/v1/users' do
  User.create(email: params[:email],
              password: params[:password],
              first_name: params[:first_name] || '',
              last_name: params[:last_name] || '').to_json
end
