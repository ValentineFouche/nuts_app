class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  # validates :comment, presence: true // bug sur la creation
  # validates :movie, uniqueness: true
end
