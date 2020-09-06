FactoryBot.define do
  factory :transactions do
    postal_code { '111-1111' }
    delivery_area_id { Faker::Number.between(from: 1, to: 47) }
    city { '横浜市' }
    address_num { '下島町5丁目3ー33' }
    building_name { 'ビル303' }
    tel { Faker::Number.number(digits: 11) }
    association :user
    association :item
    token {'tok_5ca06b51685e001723a2c3b4aeb4'}
  end
end
