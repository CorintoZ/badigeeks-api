module Badi
  module Entities
    class Location < Grape::Entity
      unexpose :data
      expose :boundingbox
      expose :display_name
      expose :city
      expose :country

      private

      def boundingbox
        "#{object.boundingbox[2]},#{object.boundingbox[0]},#{object.boundingbox[3]},#{object.boundingbox[1]}"
      end
    end
  end
end
