FactoryBot.define do
  factory :items_tag do
    tag_name { Faker::Lorem.sentence }
    name { Faker::Lorem.sentence }
    item_text { Faker::Lorem.sentence }
    price { Faker::Number.between(from: 300, to: 9999999) }
    category_id { Faker::Number.between(from: 2, to: 11) }
    item_status_id { Faker::Number.between(from: 2, to: 7) }
    delivery_burden_id { Faker::Number.between(from: 2, to: 3) }
    delivery_area_id { Faker::Number.between(from: 1, to: 47) }
    delivery_days_id { Faker::Number.between(from: 2, to: 4) }
    association :user

  end
end
# :images