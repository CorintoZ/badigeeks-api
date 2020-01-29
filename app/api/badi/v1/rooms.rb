# frozen_string_literal: true

module Badi
  require 'active_record/errors'
  module V1
    class Rooms < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      resource :rooms do
        desc 'Return rooms'
        params do
          requires :city, type: String
          requires :lat, type: Float
          requires :lon, type: Float
        end

        get do
          rooms = Room.all
          present rooms, with: Badi::Entities::RoomList
        end

        desc 'Return specific room'
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
