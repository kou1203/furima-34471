FactoryBot.define do
  factory :user do 
    nickname              { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { Faker::Name.initials(number: 2) }
    first_name            { Faker::Name.initials(number: 2) }
    last_name_kana        { Faker::Name.initials(number: 2) }
    first_name_kana       { Faker::Name.initials(number: 2) }
    birthday              {'1111-11-11'}
  end 
end 