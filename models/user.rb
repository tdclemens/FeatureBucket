# frozen_string_literal: true

# Model for Users
class User
  include Mongoid::Document
  include BCrypt
  include ActiveModel::Validations

  field :email, type: :string
  field :password, type: :string
  field :first_name, type: :string
  field :last_name, type: :string

  before_save :encrypt_password
  validates_uniqueness_of :email
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

  def name
    [first_name, last_name].join(' ')
  end

  def encrypt_password
    self.password = Password.create(@password)
  end

  index({ email: 1 }, { unique: true, name: 'email_index' } )
end
