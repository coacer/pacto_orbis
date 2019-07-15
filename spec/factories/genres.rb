FactoryBot.define do
  factory :genre do
    sequence(:name) { |n| "genre#{n}" }    
  end
end
