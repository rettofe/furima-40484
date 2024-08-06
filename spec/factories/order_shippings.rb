FactoryBot.define do
  factory :order_shipping do
    post_number { '123-4567' }
    shipping_source_id { 2 }
    city { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    phone_number { '08012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end