# frozen_string_literal: true

require 'bundler'
require 'sinatra/swagger'
Bundler.require(:default)
require_relative 'models/user'

set :bind, '172.16.0.8'
set :port, '3000'

Mongoid.load! 'mongoid.yml'

# Validate and initialize swagger config
swagger('swagger/users.yml')

# Write the swagger json to a shared volume
File.open('/swagger/swagger_spec.json', 'w') do |f|
  f.write(settings.swagger.spec.to_json)
end

configure do
  enable :cross_origin
end

get '/' do
  redirect 'http://localhost'
end

get '/api/v1/users' do
  User.all.to_json
end
