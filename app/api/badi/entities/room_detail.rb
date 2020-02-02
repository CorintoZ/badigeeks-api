module Badi
  module Entities
    class UserDetail < Grape::Entity
      expose :name
      expose :date_of_birth, as: :age
      expose :bio
      expose :gender

      private

      def date_of_birth
        now = Time.now.utc.to_date
        birthday = object[:date_of_birth].to_date
        now.year - birthday.year - (birthday.change(:year => now.year) > now ? 1 : 0)
      end
    end

    class PhotosDetail < Grape::Entity
      expose :position
      expose :url_big_photo
    end

    class RoomDetail < Grape::Entity
      expose :id
      expose :title
      expose :description
      expose :price
      expose :lat
      expose :lng
      expose :kind
      expose :room_size
      expose :flat_size
      expose :photos, using: Badi::Entities::PhotosDetail
      expose :owner, using: Badi::Entities::UserDetail
    end
  end
end
