10.times do
  User.create!(
    name: Faker::Movies::HitchhikersGuideToTheGalaxy.character,
    email: Faker::Internet.email,
    password: 'garcon123',
    admin: %w[true false].sample
  )
end

User.create!(name: 'Admin', email: 'admin@garcon.com', password: 'garcon123', admin: true)

20.times do
  Table.create!(
    reference: Faker::Games::LeagueOfLegends.champion,
    status: %w[available reserved open].sample
  )
end