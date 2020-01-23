class Photo < ApplicationRecord
  validates :position, presence: true
end
