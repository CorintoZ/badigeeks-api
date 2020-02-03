FactoryBot.define do
  factory :room do
    title { Faker::Lorem.words(rand(2..500)) }
    price { Faker::Number.between(from: 1, to: 10_000) }
    description { Faker::Lorem.words(rand(5..500)) }
    city { 'Barcelona' }
    room_size { Faker::Number.between(from: 3, to: 15) }
    flat_size { Faker::Number.between(from: 30, to: 200) }
    lat { 41.398574 }
    lng { 2.152462 }
    room_lnglat { 'POINT(2.152462 41.398574)' }
    user_id { nil }
  end
end
