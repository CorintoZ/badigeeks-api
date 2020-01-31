module Badi
  module V1
    class Locations < Grape::API
      version "v1", using: :path
      format :json
      prefix :api

      resource :locations do
        desc "Return locations"

        params do
          requires :keyword, type: String, values: ->(v) { v.length > 2 }
        end

        get do
          @query = LocationQuery.new(params[:keyword]).get_results
          if @query.empty?
            raise Badi::V1::ExceptionsHandler::NoContent
          else
            present @query, with: Badi::Entities::Location
          end
        end
      end
    end
  end
end
