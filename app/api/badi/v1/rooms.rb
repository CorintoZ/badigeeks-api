module Badi
  module V1
    class Rooms < Grape::API
      version "v1", using: :path
      format :json
      prefix :api

      resource :rooms do
        desc "Return rooms"
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
