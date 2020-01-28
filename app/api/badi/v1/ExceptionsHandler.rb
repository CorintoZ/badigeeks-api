# frozen_string_literal: true
module Badi
  module V1
    module ExceptionsHandler
      extend ActiveSupport::Concern
      included do
        rescue_from :all do |e|
          error!('ArgumentError: error!!!!!')
        end
      end
    end
  end
end
