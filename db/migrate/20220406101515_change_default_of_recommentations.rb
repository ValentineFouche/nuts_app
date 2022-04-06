class ChangeDefaultOfRecommentations < ActiveRecord::Migration[6.1]
  def change
    change_column_default :recommendations, :viewed, from: nil, to: false
    change_column_default :recommendations, :searched, from: nil, to: false
  end
end
