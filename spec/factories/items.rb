FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    price {Faker::Lorem.sentence}
    explanation {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    category_id {2}
    status_id {2}
    ship_method_id {2}
    area_id {2}
    ship_date_id {2}

    association :user
  end
end