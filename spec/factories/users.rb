FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password  {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name {"田中"}
    last_name {"太郎"}
    fname {"タナカ"}
    lname {"タロウ"}
    birthday {"2020-01-01"}
  end
end
