FactoryBot.define do
  factory :item do
    sequence(:title) { |n| "item#{n}" }
    sequence(:price) { |n| 1000 * n }
    status { true }
    jacket_image_id { "" }
    sequence(:stock) { |n| 10 * n }
    # artist { nil }
    # label { nil }
    # genre { nil }
    association :artist
    association :label
    association :genre
  end
end
