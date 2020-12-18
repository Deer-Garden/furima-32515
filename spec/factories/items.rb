FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    price {1000}
    explanation {Faker::Lorem.sentence}
    category_id {2}
    status_id {2}
    ship_method_id {2}
    area_id {2}
    ship_date_id {2}
    user_id {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test-footer.png'), filename: 'test-footer.png')
    end
  end
end