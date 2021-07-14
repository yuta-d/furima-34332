FactoryBot.define do
  factory :purchase_address do
    postal_code          { "123-1234"}
    prefecture_id        {2}
    city                 { "旭川市" }
    number               { "1-1" }
    build_name           { "テスト" }
    telephone            { "12312312312"}
  end
end