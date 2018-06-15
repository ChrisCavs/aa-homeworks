require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Band.destroy_all
Album.destroy_all
Track.destroy_all
Like.destroy_all

u1 = User.create(email: 'chris@gmail.com', password: 'batman', name: 'Chris Cavs')

b1 = Band.create(name: 'The Griffin')
b2 = Band.create(name: 'Pop OFF')
b3 = Band.create(name: 'Foo Free Fall')

a1 = Album.create(
  band_id: b1.id,
  title: 'See Ya',
  year: 1994,
  url: 'https://static1.squarespace.com/static/58be8f01893fc0f727455040/58fe65796a4963418dc41b39/58fe6edb8419c2c6c8a2f93f/1516812150510/seeya_1.jpg?format=1500w')

a2 = Album.create(
  band_id: b1.id,
  title: 'Flexin',
  year: 1997,
  url: 'https://assets.audiomack.com/frequinncy/flexin-freestyle-275-275-1522687840.jpg')

a3 = Album.create(
  band_id: b2.id,
  title: 'The Way You Feel',
  year: 2010,
  url: 'https://vignette.wikia.nocookie.net/warframe/images/c/c9/Born_to_feel.jpg/revision/latest?cb=20150917060317')

a4 = Album.create(
  band_id: b2.id,
  title: 'Runnin You Up',
  year: 2012,
  url: 'https://qph.fs.quoracdn.net/main-qimg-6ac2477c66a6366d05ee346e0248c510-c')

a5 = Album.create(
  band_id: b3.id,
  title: 'What You Want From Me',
  year: 1999,
  url: 'https://upload.wikimedia.org/wikipedia/en/2/28/Monaco_-_What_Do_You_Want_From_Me.jpg')

[a1, a2, a3, a4, a5].each do |album|
  8.times do |i|
    Track.create(
      album_id: album.id,
      title: Faker::Lorem.sentence,
      ord: (i+1),
    )
  end
end
