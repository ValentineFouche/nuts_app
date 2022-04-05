class List < ApplicationRecord
  belongs_to :user
  has_many :movies_lists
  has_many :movies, through: :movies_lists
end
