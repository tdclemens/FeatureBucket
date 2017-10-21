# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'bson_ext', '~>1.5.1'
gem 'mongo', '2.4.3'
gem 'mongoid', '~> 6.1.0'
gem 'rake', '~>12.1.0'
gem 'sinatra', '1.4.8'
gem 'sinatra-cross_origin', '~>0.3.1'
gem 'sinatra-swagger', '~>0.4.2'

group :development do
  gem 'rubocop', '~>0.51.0'
end

group :test do
  gem 'factory_bot', '~>4.8.2'
  gem 'ffaker', '~>2.1.0'
  gem 'rack-test', '~>0.7.0'
end

group :development, :test do
  gem 'pry', '~>0.10.4'
end
