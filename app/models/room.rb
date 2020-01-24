# frozen_string_literal: true

class Room < ApplicationRecord
  has_many :photos, dependent: :destroy
  belongs_to :user

  validates :title, presence: true, length: { minimum: 1, maximum: 500 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 10_000 }
  validates :description, presence: true
  validates :kind, presence: true
  validates :lat, presence: true, numericality: { minimum: -90, maximum: +90 }
  validates :lng, presence: true, numericality: { minimum: -180, maximum: +180 }
end
