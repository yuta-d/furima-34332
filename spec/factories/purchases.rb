FactoryBot.define do
  factory :purchase do
    association :item
    association :address
  end
end
