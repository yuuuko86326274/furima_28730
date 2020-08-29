FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 8)
    password {password}
    password_confirmation {password}
    first_name{Faker::Name.first_name}
    last_name{Faker::Name.last_name}
    first_name_pkey{Faker::Name.first_name}
    last_name_pkey{Faker::Name.last_name}
    birthday{Faker::Date.birthday}
  end
end