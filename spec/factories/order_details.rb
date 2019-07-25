FactoryBot.define do
  cd_price = Faker::Number.number(4)
  cd_amount = Faker::Number.number(1)

  factory :order_detail do
    cd_amount { cd_amount }
    cd_price { cd_price }
    association :order
    association :item
  end
end
