# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

15.times do
  Artist.create!(name: Faker::Music.band)
  Label.create!(name: Faker::Team.creature)
  Genre.create!(name: Faker::Music.genre)
end

30.times do
  shuffle_ids = (1..15).to_a.shuffle[0..2]
  item = Item.create!(
    title: Faker::Music.album,
    price: Faker::Number.number(4),
    stock: 20,
    artist_id: shuffle_ids[0],
    label_id: shuffle_ids[1],
    genre_id: shuffle_ids[2]
  )

  3.times do
    disk = Disk.create!(item_id: item.id)

    13.times do
      Song.create!(title: Faker::Kpop.i_groups, disk_id: disk.id)
    end

  end
end
