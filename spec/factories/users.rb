FactoryBot.define do
  # 稀にカタカナの名前が入るのでコメントアウト
  # first_name = Faker::Japanese::Name.first_name
  # last_name = Faker::Japanese::Name.last_name
  phone = Faker::Number.number(11)
  postal_code = Faker::Number.number(7)
  address = Gimei.address
  street = Faker::Number.number(4) + '-' + Faker::Number.number(3)

  factory :user do
    # first_name { first_name }    
    # last_name { last_name }    
    # kana_first_name { first_name.yomi }    
    # kana_last_name { last_name.yomi }    
    first_name { "太郎" }    
    last_name { "山田" }    
    kana_first_name { "タロウ" }    
    kana_last_name { "ヤマダ" }    
    phone { phone }
    postal_code { postal_code }
    prefecture_name { address.prefecture.kanji }
    city { address.city.kanji }
    street { street }
    sequence(:email) { |n| "example@test#{n}.com" }    
    password { "password" }    
    password_confirmation { "password" }    
  end
end
