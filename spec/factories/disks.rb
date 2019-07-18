FactoryBot.define do
  factory :disk do
    association :item
  end

  factory :disk_create_with_songs, class: Disk do
    association :item
    after(:create) do |disk|
      create_list(:song, 13, disk: disk)
    end
  end
end
