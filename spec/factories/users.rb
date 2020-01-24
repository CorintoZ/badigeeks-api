# frozen_string_literal: true

FactoryBot.define do
  factory :users do
    name { Faker::Name.name }
    age { Faker::Number.between(from: 1, to: 120) }
  end
end
