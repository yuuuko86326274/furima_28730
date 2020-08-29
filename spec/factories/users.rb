FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name { '山田' }
    last_name { '山田' }
    first_name_pkey { 'タロウ' }
    last_name_pkey { 'タロウ' }
    birthday { Faker::Date.birthday }
  end
end
