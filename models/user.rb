# frozen_string_literal: true

# Model for Users
class User
  include Mongoid::Document
  include BCrypt

  field :email, type: :string
  field :password, type: :string
  field :first_name, type: :string
  field :last_name, type: :string

  before_save :encrypt_password

  def name
    [first_name, last_name].join(' ')
  end

  def encrypt_password
    self.password = Password.create(@password)
  end

  index({ email: 1 }, unique: true, name: 'email_index')
end
