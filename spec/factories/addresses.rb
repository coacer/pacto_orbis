FactoryBot.define do
  postal_code = Faker::Number.number(7)
  address = Gimei.address
  street = Faker::Number.number(4) + '-' + Faker::Number.number(3)

  factory :address do
    name { "山田 太郎" }
    postal_code { postal_code }
    prefecture_name { address.prefecture.kanji }
    city { address.city.kanji }
    street { street }
    association :user
  end
end
