# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    date_of_birth { Faker::Date.birthday }
  end
end
