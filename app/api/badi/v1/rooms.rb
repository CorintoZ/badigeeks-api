include Pagy::Backend

module Badi
  require "active_record/errors"

  module V1
    class Rooms < Grape::API
      require_relative "./validations/bounds_checker"
      version "v1", using: :path

      helpers Helpers::RoomSortingHelpers
      helpers Helpers::FilteringHelpers
      helpers Helpers::SimilarityHelpers

      format :json
      prefix :api

      resource :rooms do
        desc "Return rooms"
        params do
          requires :bounds, type: String, bounds_checker: true
          requires :page, type: Integer
          requires :size, type: Integer
          optional :order_type, type: String, values: ["price"]
          given :order_type do
            requires :order, type: String, values: %w[ASC asc DESC desc]
          end
          optional :min, type: Integer, default: 0
          optional :max, type: Integer, default: 10_000
        end
        get do
          @rooms = Room.within(params[:bounds]).where(filtering(params[:min], params[:max])).order(sorting(params[:order_type], params[:order]))
          raise Badi::V1::ExceptionsHandler::NoContent if @rooms.empty?

          @pagy, @records = pagy(@rooms, items: params[:size])

          present @records, with: Badi::Entities::RoomList
        end

        desc "Return specific room"
        route_param :id do
          get do
            @room = Room.find(params[:id])
            @room.similar_rooms = similar_rooms(@room.lng, @room.lat, @room.price, @room.id)
            present @room, with: Badi::Entities::RoomDetail
          end
        end
      end
    end
  end
end
