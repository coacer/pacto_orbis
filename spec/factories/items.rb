FactoryBot.define do
  factory :item do
    sequence(:title) { |n| "item#{n}" }
    sequence(:price) { |n| 1000 * n }
    status { true }
    jacket_image_id { "" }
    sequence(:stock) { |n| 10 * n }
    association :artist
    association :label
    association :genre

    trait :create_with_disks do
      after(:create) do |item|
        create_list(:disk_create_with_songs, 3, item: item)
      end
    end
  end
end
