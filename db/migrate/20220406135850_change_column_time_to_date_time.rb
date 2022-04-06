class ChangeColumnTimeToDateTime < ActiveRecord::Migration[6.1]
  def change
    remove_column :recommendations, :added_on
    add_column :recommendations, :added_on, :datetime
  end
end
