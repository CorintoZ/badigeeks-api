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
          requires :xmin, type: Float
          requires :ymin, type: Float
          requires :xmax, type: Float
          requires :ymax, type: Float
        end

        get do
          present Room.within(params[:xmin], params[:ymin], params[:xmax], params[:ymax])
        end

        desc "Return specific room"
        route_param :id do
          get do
            room = Room.find(params[:id])
            present room
          end
        end
      end
    end
  end
end
