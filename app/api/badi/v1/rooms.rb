# frozen_string_literal: true

module Badi
  require "active_record/errors"

  module V1
    class Rooms < Grape::API
      require_relative "./validations/bounds_checker"
      version "v1", using: :path

      helpers Helpers::RoomSortingHelpers
      helpers Helpers::FilteringHelpers

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
            requires :order, type: String, values: ["ASC", "asc", "DESC", "desc"]
          end
          optional :min, type: Integer, default: 0
          optional :max, type: Integer, default: 10000
        end
        get do
          @rooms = Room.within(params[:bounds]).where(filtering(params[:min], params[:max])).order(sorting(params[:order_type], params[:order])).paginate(page: params[:page], per_page: params[:size])
          if @rooms.empty?
            raise Badi::V1::ExceptionsHandler::NoContent
          else
            present @rooms, with: Badi::Entities::RoomList
          end
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
