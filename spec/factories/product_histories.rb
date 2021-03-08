FactoryBot.define do
  factory :product_history do
    association :user
    association :product
  end
end
