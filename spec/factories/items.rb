FactoryBot.define do
  factory :item do
    name          { 'ひらがな' }
    text          { 'ひらがな' }
    price         { '10000' }
    category_id { '2' }
    condition_id { '2' }
    delivery_charge_id { '2' }
    delivery_day_id { '2' }
    prefecture_id { '1' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
