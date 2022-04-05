class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  belongs_to :restaurant
  belongs_to :podcast
  belongs_to :book
end
