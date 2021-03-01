FactoryBot.define do
  factory :product do
    name                   { 'テスト' }
    description            { 'テスト' }
    category_id            { 3 }
    status_id              { 2 }
    shipping_burden_id     { 2 }
    prefecture_id          { 3 }
    days_to_ship_id        { 2 }
    price                  { 5000 }
    association :user 

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/staff1.jpg'), filename: 'staff1.jpg', content_type: 'image/jpg')
    end 
  end
end
