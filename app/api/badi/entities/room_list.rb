module Badi
  module Entities
    class UserList < Grape::Entity
      expose :name
      expose :date_of_birth, as: :age
      expose :gender

      private

      def date_of_birth
        now = Time.now.utc.to_date
        birthday = object[:date_of_birth].to_date
        now.year - birthday.year - (birthday.change(year: now.year) > now ? 1 : 0)
      end
    end

    class PhotosList < Grape::Entity
      expose :position
      expose :url_small
    end

    class RoomList < Grape::Entity
      expose :id
      expose :title
      expose :price
      expose :city
      expose :photos, using: Badi::Entities::PhotosList
      expose :owner, using: Badi::Entities::UserList
    end
  end
end
