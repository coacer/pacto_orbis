# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

15.times do |n|
  Artist.create!(name: "アーティスト#{n + 1}")
  Label.create!(name: "レーベル#{n + 1}")
  Genre.create!(name: "ジャンル#{n + 1}")
end

30.times do |n|
  shuffle_ids = (1..15).to_a.shuffle[0..2]
  item = Item.create!(
    title: "アルバム#{n}",
    price: n * 1000,
    stock: 20,
    artist_id: shuffle_ids[0],
    label_id: shuffle_ids[1],
    genre_id: shuffle_ids[2]
  )

  3.times do
    disk = Disk.create!(item_id: item.id)

    13.times do |j|
      Song.create!(title: "ソング#{j}", disk_id: disk.id)
    end

  end
end
