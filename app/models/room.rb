# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :photos, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { minimum: 1, maximum: 500 }
  validates :price, presence: true, numericality: { only_float: true, greater_than: 0, less_than: 10_000 }
  validate  :description
  validates :kind, presence: true
  validates :room_size, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 3, less_than_or_equal: 15 }
  validates :flat_size, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 30, less_than_or_equal: 200 }
  validates :lat, presence: true, numericality: { minimum: -90, maximum: +90 }
  validates :lng, presence: true, numericality: { minimum: -180, maximum: +180 }
end
