# User factory
FactoryBot.define do
  factory :user do
    email FFaker::Internet.email
    password FFaker::Internet.password
    first_name FFaker::Name.first_name
    last_name FFaker::Name.last_name
  end
end
