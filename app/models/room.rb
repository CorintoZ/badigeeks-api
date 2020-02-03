class Room < ApplicationRecord
  has_many :photos, dependent: :destroy
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'

  validates :title, presence: true, length: { minimum: 1, maximum: 1000 }
  validates :price, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 10, less_than_or_equal_to: 10_000 }
  validates :description, length: { maximum: 5000 }
  validate :room_lnglat
  validates :city, presence: true, length: { minimum: 1, maximum: 500 }
  validates :room_size, presence: true, numericality: { only_interger: true, greater_than_or_equal_to: 3, less_than_or_equal_to: 15 }
  validates :flat_size, presence: true, numericality: { only_interger: true, greater_than_or_equal_to: 30, less_than_or_equal_to: 200 }
  validates :lat, presence: true, numericality: { only_float: true, greater_than_or_equal_to: -90, less_than_or_equal_to: +90 }
  validates :lng, presence: true, numericality: { only_float: true, greater_than_or_equal_to: -180, less_than_or_equal_to: +180 }
  scope :within, lambda { |bounds|
    bounds = bounds.split(',')
    where(%{ rooms.room_lnglat && ST_MakeEnvelope(?,?,?,?)
    }, bounds[0].to_f, bounds[1].to_f, bounds[2].to_f, bounds[3].to_f)
  }
end
