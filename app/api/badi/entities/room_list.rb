module Badi
  module Entities
    class UserList < Grape::Entity
      expose :name
      expose :date_of_birth
      expose :gender
    end

    class PhotosList < Grape::Entity
      expose :position
      expose :url_small_photo
    end

    class RoomList < Grape::Entity
      expose :id
      expose :title
      expose :price
      expose :kind
      expose :photos, using: Badi::Entities::PhotosList
      expose :user, using: Badi::Entities::UserList
    end
  end
end
