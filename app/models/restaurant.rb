class Restaurant < ApplicationRecord
  # has_many :recommendations >> sert à rien
  has_many :restaurantrecoms
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
