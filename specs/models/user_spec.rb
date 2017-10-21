# frozen_string_literal: true

require 'test_helper'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe 'User' do
  describe '#name' do
    it 'should return first name joined with last name' do
      user = FactoryBot.build(:user)
      user.name.must_be :==, [user.first_name, user.last_name].join(' ')
    end
  end
end
