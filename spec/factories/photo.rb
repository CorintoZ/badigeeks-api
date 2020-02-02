# frozen_string_literal: true

FactoryBot.define do
  factory :photo do
    position { Faker::Number.between(from: 10, to: 100) } 
    url_small {'https://d1jhx8f0okmpxm.cloudfront.net/uploads/pictures/width_100_f4527618-eaf7-4fff-a889-24116c06427c.jpeg'}
    url_big {'https://d1jhx8f0okmpxm.cloudfront.net/uploads/pictures/width_1080_f4527618-eaf7-4fff-a889-24116c06427c.jpeg'}
    room_id {nil}
  end
end
