FactoryBot.define do
  # 稀にカタカナの名前が入るのでコメントアウト
  # first_name = Faker::Japanese::Name.first_name
  # last_name = Faker::Japanese::Name.last_name
  phone = Faker::Number.number(11)
  postal_code = Faker::Number.number(7)
  address = Faker::Address.full_address

  factory :user do
    # first_name { first_name }    
    # last_name { last_name }    
    # kana_first_name { first_name.yomi }    
    # kana_last_name { last_name.yomi }    
    first_name { "山田" }    
    last_name { "太郎" }    
    kana_first_name { "ヤマダ" }    
    kana_last_name { "タロウ" }    
    phone { phone }
    postal_code { postal_code }
    address { address }
    sequence(:email) { |n| "example@test#{n}.com" }    
    password { "password" }    
    password_confirmation { "password" }    
  end
end
