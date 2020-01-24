# frozen_string_literal: true

FactoryBot.define do
  factory :photos do
    position { Faker::Number.number(5) }
  end
end
