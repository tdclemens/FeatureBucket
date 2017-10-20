# frozen_string_literal: true
source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'bson_ext', '~>1.5.1'
gem 'mongo', '2.4.3'
gem 'mongoid', '~> 6.1.0'
gem 'rake', '~>12.1.0'
gem 'sinatra', '2.0.0'

group :development do
  gem 'rubocop', '~>0.51.0'
end

group :test do
  gem 'factory_girl', '~>4.8.1'
  gem 'rack-test', '~>0.6.3'
end

group :development, :test do
  gem 'pry', '~>0.10.4'
end
