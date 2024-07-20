FactoryBot.define do
  factory :item do
    title { 'テスト商品' }
    description { 'これはテスト商品です' }
    category_id { 2 }
    condition_id { 2 }
    delivery_charge_id { 2 }
    shipping_source_id { 2 }
    shipping_day_id { 2 }
    price { 500 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
