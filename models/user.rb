# frozen_string_literal: true

# Model for Users
class User
  include Mongoid::Document
  field :email, :type => :string
  field :password, :type => :string
  field :first_name, :type => :string
  field :last_name, :type => :string

  def name
    [last_name, first_name].join(' ')
  end

  index({ email: 1 }, { unique: true, name: 'email_index' })
end
