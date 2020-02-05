FactoryBot.define do
  factory :user do
    name { Faker::Name.name[1..200] }
    date_of_birth { Faker::Date.birthday }
    bio { Faker::Lorem.words(number: rand(5..100)) }
    gender { %w[male female].sample }
  end
end
