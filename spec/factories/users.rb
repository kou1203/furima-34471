FactoryBot.define do
  factory :user do 
    nickname              { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.free_email }
    password              { '1a'+Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { '手酢戸' }
    first_name            { '手巣都' }
    last_name_kana        { 'テスト' }
    first_name_kana       { 'テスト' }
    birthday              {'1111-11-11'}
  end 
end 