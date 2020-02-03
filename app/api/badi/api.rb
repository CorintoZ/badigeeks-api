module Badi
  class API < Grape::API
    format :json
    content_type :json, 'application/json; charset=utf-8'

    include Badi::V1::ExceptionsHandler

    mount Badi::Health
    mount Badi::V1::Rooms
    mount Badi::V1::Locations
  end
end
