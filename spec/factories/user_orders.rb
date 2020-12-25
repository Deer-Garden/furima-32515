FactoryBot.define do
  factory :user_order do
    postal_code { '123-4567' }
    prefecture { 1 }
    city { '東京都' }
    street { '1-1' }
    build { '東京ハイツ' }
    phone { '12312312312' }
    user_id { 1 }
    item_id { 2 }
  end
end
