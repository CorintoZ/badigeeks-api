# frozen_string_literal: true

module Badi
  module V1
    module ExceptionsHandler
      extend ActiveSupport::Concern

      included do

        rescue_from ActiveRecord::RecordNotFound do |e|
          error!(e, 404)
        end

        rescue_from Grape::Exceptions::ValidationErrors do |e|
          error!(e, 400)
        end

      end
    end
  end
end
