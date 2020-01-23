module Badi
  module V1
    class Rooms < Grape::API
      version "v1", using: :path
      format :json
      prefix :api

      resource :rooms do
        desc "Return rooms"
        params do
          requires :city, type: String
          requires :lat, type: Float
          requires :lon, type: Float
        end

        get do
        end

        desc "Return specific room"
        route_param :id do
          get do
          end
        end
      end
    end
  end
end
