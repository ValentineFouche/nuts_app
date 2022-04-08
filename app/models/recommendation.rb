class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  # validates :comment, presence: true // bug sur la creation
end
