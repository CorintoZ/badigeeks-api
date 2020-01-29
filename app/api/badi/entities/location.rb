module Badi
  module Entities
    class Location < Grape::Entity
      unexpose :data
      expose :boundingbox
      expose :display_name
      expose :city
      expose :country
    end
  end
end
