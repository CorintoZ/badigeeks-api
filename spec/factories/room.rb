# frozen_string_literal: true

FactoryBot.define do
  factory :room do
    title { Faker::Lorem.word }
    price { Faker::Number.between(from: 1, to: 10_000) }
    description { Faker::Lorem.sentence }
    lat { Faker::Number.positive }
    lng { Faker::Number.positive }
    kind { "Barcelona" }
    user_id { nil }
  end
end
