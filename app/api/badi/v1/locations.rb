require_relative "validations/lenght"

module Badi
  module V1
    class Locations < Grape::API
      version "v1", using: :path
      format :json
      prefix :api

      resource :locations do
        desc "Return locations"

        params do
          requires :keyword, type: String, length: 3
        end

        get do
        end
      end
    end
  end
end
