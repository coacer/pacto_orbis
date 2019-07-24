# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(email: "coacer@vate.com", password: "password", password_confirmation: "password")

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

  20.times do |i|
    first_name = Faker::Japanese::Name.first_name
    last_name = Faker::Japanese::Name.last_name
    postal_code = Faker::Number.number(7)
    phone = Faker::Number.number(11)
    address = Gimei.address
    street = Faker::Number.number(4) + '-' + Faker::Number.number(3)

    user = User.create(
      first_name: first_name,
      last_name: last_name,
      kana_first_name: first_name.yomi,
      kana_last_name: last_name.yomi,
      postal_code: postal_code,
      phone: phone,
      prefecture_name: address.prefecture.kanji,
      city: address.city.kanji,
      street: street,
      email: "example@test#{i}.com",
      password: "password",
      password_confirmation: "password"
    )

    if user.valid?
      5.times do
        name = Faker::Japanese::Name.name
        postal_code = Faker::Number.number(7)
        address = Gimei.address
        street = Faker::Number.number(4) + '-' + Faker::Number.number(3)
        user.addresses.create!(
          name: name,
          postal_code: postal_code,
          prefecture_name: address.prefecture.kanji,
          city: address.city.kanji,
          street: street
        )

        random_num = (1..30).to_a.shuffle[0]
        user.cart_items.create!(item_id: random_num, amount: random_num)
      end
    end

  end
