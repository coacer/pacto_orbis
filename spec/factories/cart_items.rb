FactoryBot.define do
  amount = (1..20).to_a.shuffle[0]
  factory :cart_item do
    amount { amount }
    association user
    association item
  end
end
