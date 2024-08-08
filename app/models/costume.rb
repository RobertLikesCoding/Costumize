class Costume < ApplicationRecord
  CATEGORIES = ["superhero", "historical", "movie", "tv show", "animal", "other"]
  SIZES = ["S", "M", "L", "XL", "XXL", "other"]

  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :name, :category, :size, :description, :price_per_day, presence: true
  validates :description, uniqueness: true
  validates :name, :description, length: { minimum: 5 }
  validates :price_per_day, numericality: { greater_than: 0 }
  validates :category, inclusion: { in: CATEGORIES }
  validates :size, inclusion: { in: SIZES }

  has_many_attached :photos
end
