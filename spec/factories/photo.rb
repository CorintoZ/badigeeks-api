# frozen_string_literal: true

FactoryBot.define do
  factory :photo do
    position { Faker::Number.number(5) }
  end
end
