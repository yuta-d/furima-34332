FactoryBot.define do
  factory :item do
    item_name           {"test"}
    description         {"test"}
    category_id         {2}
    quality_id          {2}
    delivaliy_cost_id   {2}
    prefecture_id       {2}
    delivaliy_day_id    {2}
    price               {"300"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/ダウンロード.jpeg'), filename: 'ダウンロード.jpeg')
    end
  end
end
