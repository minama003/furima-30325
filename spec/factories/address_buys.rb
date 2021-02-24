FactoryBot.define do
  factory :address_buy do
    post_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { "12_345_678_901" }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
