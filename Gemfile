# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'bson_ext', '~>1.5.1'
gem 'mongo', '2.13.0'
gem 'mongoid', '~>7.1.2'
gem 'rake', '~>12.3.2'
gem 'sinatra', '1.4.8'
gem 'sinatra-cross_origin', '~>0.4.0'
gem 'sinatra-swagger', '~>0.4.2'
gem 'bcrypt', '~>3.1.15'
gem 'sinatra-logger', '~>0.3.2'

group :development do
  gem 'rubocop', '~>0.89.1'
end

group :test do
  gem 'factory_bot', '~>6.1.0'
  gem 'ffaker', '~>2.17.0'
  gem 'rack-test', '~>1.1.0'
end

group :development, :test do
  gem 'pry', '~>0.13.1'
end
