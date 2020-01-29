module Badi
  module V1
    class Rooms < Grape::API
      version "v1", using: :path

      helpers Helpers::RoomSortingHelpers

      format :json
      prefix :api

      resource :rooms do
        desc "Return rooms"
        params do
          requires :x1, type: Float, values: ->(v) { v.between?(-180.0, 180.0) }
          requires :y1, type: Float, values: ->(v) { v.between?(-90.0, 90.0) }
          requires :x2, type: Float, values: ->(v) { v.between?(-180.0, 180.0) }
          requires :y2, type: Float, values: ->(v) { v.between?(-90.0, 90) }
          requires :page, type: Integer
          requires :size, type: Integer
          optional :sort, type: Integer, values: [2, 3]
        end

        get do
          @rooms = Room.within(params[:x1], params[:y1], params[:x2], params[:y2]).paginate(page: params[:page], per_page: params[:size]).order(sorting(params[:sort]))

          present @rooms, with: Badi::Entities::RoomList
        end

        desc "Return specific room"
        route_param :id do
          get do
            room = Room.find(params[:id])
            present room, with: Badi::Entities::RoomDetail
          end
        end
      end
    end
  end
end
