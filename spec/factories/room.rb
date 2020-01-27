# frozen_string_literal: true

FactoryBot.define do
  factory :room do
    title { Faker::Lorem.word }
    price { Faker::Number.between(from: 1, to: 10_000) }
    description { Faker::Lorem.sentence }
    kind { 'Barcelona' }
    room_size { Faker::Number.between(from: 3, to: 15) }
    flat_size { Faker::Number.between(from: 30, to: 200) }
    lat { Faker::Number.positive }
    lng { Faker::Number.positive }
    user_id { nil }
  end
end
