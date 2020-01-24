# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :photos, dependent: :destroy
  belongs_to :user
  validates :title, :price, :description, :kind, :lat, :lng, presence: true
  validates :title, :price, length: { minimum: 5, maximum: 30 }
  validates :price, numericality: { only_integer: true, greater_than: 0, less_than: 10_000 }
  validates :lat, numericality: { minimum: -90, maximum: +90 }
  validates :lng, numericality: { minimum: -180, maximum: +180 }
end
