require 'sinatra'
require 'mongoid'
require_relative 'models/user'

set :bind, '172.16.0.8'
set :port, '3000'

Mongoid.load! 'mongoid.yml'

get '/' do
  "Hello World #{params[:name]}".strip
end
