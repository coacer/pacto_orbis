FactoryBot.define do
  postal_code = Faker::Number.number(7)
  total_price = Faker::Number.number(5)
  address = Gimei.address.kanji

  factory :order do
    total_price { total_price }
    payment { 0 }
    status { 0 }
    postal_code { postal_code }
    address { address }
    delivery_cost { 500 }
    association :user
  end
end
