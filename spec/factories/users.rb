FactoryBot.define do
  factory :user do
    nickname {"furima"}
    email {Faker::Internet.free_email}
    password  { Faker::Lorem.characters( number: 6, min_numeric: 1) }
    password_confirmation { password }
    first_name {"たなか"}
    family_name {"いちろう"}
    first_name_kana {"タナカ"}
    family_name_kana {"イチロウ"}
    birth_day {"1995-01-01"}
  end
end