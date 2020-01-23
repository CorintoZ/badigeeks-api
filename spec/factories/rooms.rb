# frozen_string_literal: true

FactoryBot.define do
  factory :rooms do
    name { Faker::Lorem.word }
    price { Faker::Number.between(from: 1, to: 10_000) }
    description { Faker::Lorem.sentence }
    lat { Faker::Number.positive }
    lng { Faker::Number.positive }
    kind { 'Barcelona' }
  end
end
