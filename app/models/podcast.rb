class Podcast < ApplicationRecord
  has_many :recommendations
  has_many :podcastrecoms
end
