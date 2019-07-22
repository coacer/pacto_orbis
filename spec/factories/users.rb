FactoryBot.define do
  first_name = Faker::Japanese::Name.first_name
  last_name = Faker::Japanese::Name.last_name
  phone = Faker::Number.number(11)
  postal_code = Faker::Number.number(7)
  address = Faker::Address.full_address

  factory :user do
    first_name { first_name }    
    last_name { last_name }    
    kana_first_name { first_name.yomi }    
    kana_last_name { last_name.yomi }    
    phone { phone }
    postal_code { postal_code }
    address { address }
    sequence(:email) { |n| "example@test#{n}.com" }    
    password { "password" }    
    password_confirmation { "password" }    
  end
end
