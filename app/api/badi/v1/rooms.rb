# frozen_string_literal: true

module Badi
  require "active_record/errors"

  module V1
    class Rooms < Grape::API
      require_relative "./validations/bounds_checker"
      version "v1", using: :path

      helpers Helpers::RoomSortingHelpers

      format :json
      prefix :api

      resource :rooms do
        desc "Return rooms"
        params do
          requires :bounds, type: String, bounds_checker: true
          requires :page, type: Integer
          requires :size, type: Integer
          optional :sort, type: Integer, values: [2, 3]
        end
        get do
          @rooms = Room.within(params[:bounds]).paginate(page: params[:page], per_page: params[:size]).order(sorting(params[:sort]))
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
