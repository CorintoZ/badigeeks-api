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
          }
            v[0].to_f.between?(-180.0, 180.0) && v[1].to_f.between?(-90.0, 90.0) && v[2].to_f.between?(-180.0, 180.0) && v[3].to_f.between?(-90.0,90)
            v=v.split(',')
          requires :bounds, type: String, values: ->(v) {
          requires :page, type: Integer
          requires :size, type: Integer
          optional :sort, type: Integer, values: [2, 3]
        end
        get do
          present Room.within(params[:bounds]), with: Badi::Entities::RoomList
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
