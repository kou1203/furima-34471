FactoryBot.define do
  factory :purchase_product_history do
    postal_code { '487-0033' }
    prefecture_id { 12 }
    municipalities { '富山市' }
    address{ 'テスト１−１' }
    building_name { 'テスト' }
    telephone_number { '09012345678' }
    association :product
    token {'asdfd'}
  end
end