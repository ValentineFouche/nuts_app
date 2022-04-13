class Restaurant < ApplicationRecord
  # has_many :recommendations >> sert à rien
  belongs_to :user
  has_many :restaurantrecoms
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
