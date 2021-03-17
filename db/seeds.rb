18.times do
  User.create!(
    name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
    email: Faker::Internet.email,
    password: 'garcon123',
    admin: %w[true false].sample
  )
end

User.create! (
  name: 'Admin',
  email: 'admin@garcon.com',
  password: 'garcon123',
  admin: true
)

20.times do
  Table.create!(
    name: Faker::Games::LeagueOfLegends.champion,
    admin: %w[available reserved blocked].sample
  )
end