class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recommendations
  has_many :bookrecoms
  # geocoded_by :ip_address,
  #             :latitude => :lat, :longitude => :lon
  # after_validation :geocode
  has_many :restaurantrecoms
  has_many :podcastrecoms
  validates :nickname, uniqueness: true
end
