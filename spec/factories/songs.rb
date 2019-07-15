FactoryBot.define do
  factory :song do
    sequence(:title) { |n| "song#{n}" }
    association :disk
  end
end
