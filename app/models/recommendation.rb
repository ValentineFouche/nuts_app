class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  # validates :movie, uniqueness: true # >> plus de validation ici car pose problème avec l'ajout de films d'un ami
  # (ils ont le même ID). On contourne autrement.
end
