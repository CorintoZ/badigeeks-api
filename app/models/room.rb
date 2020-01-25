# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :photos, dependent: :destroy
  belongs_to :user
  validates :title, :price, :description, :kind, presence: true
  validates :title, length: { minimum: 5, maximum: 30 }
  validates :price, length: { minimum: 2, maximum: 4 }
  validates :price, numericality: { only_integer: true, greater_than: 0, less_than: 10_000 }
  scope :within,->(xmin, ymin, xmax, ymax) {
    where(%{ rooms.room_lnglat && ST_MakeEnvelope(?,?,?,?)
    }, xmin, ymin, xmax, ymax)
  }
end
