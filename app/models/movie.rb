class Movie < ApplicationRecord
  has_many :movies_lists
  has_many :lists, through: :movies_lists
  has_many :recommendations
end
